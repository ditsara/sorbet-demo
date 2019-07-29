# typed: false
# frozen_string_literal: true

# nodoc
class Transaction < ApplicationRecord
  extend T::Sig

  has_many :line_items, dependent: :destroy
  enum status: [:draft, :approved]

  before_validation do
    self.status ||= :draft  
  end

  validate :balanced_transaction, if: :approved?
  validate :minimum_one_line_item

  accepts_nested_attributes_for :line_items, allow_destroy: true

  def balanced_transaction
    return if line_items.to_a.sum(&:amount) == 0
    errors.add(:line_items, 'debits not equal to credits')
  end

  def minimum_one_line_item
    return if line_items.length >= 1
    errors.add(:line_items, 'must add at least one')
  end

  def self.sort_of_break_sorbet
    account = Account.find_by name: 'This account does not exist'
    LineItem.new account: account
  end

  sig { params(account: Account).returns(LineItem) }
  def self.gen_line_item(account)
    LineItem.new account: account
  end

  def self.caught_by_sorbet_runtime
    gen_line_item(Account.find_by(name: "This account does not exist"))
  end

  sig { returns(T.nilable(Account)) }
  def self.account_maybe
    Account.find_by name: 'This account does not exist'
  end

  sig { returns(LineItem) }
  def self.not_caught_by_sorbet_checktime
    gen_line_item(account_maybe)
  end
end
