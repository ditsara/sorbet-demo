# frozen_string_literal: true

# nodoc
class Transaction < ApplicationRecord
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
end
