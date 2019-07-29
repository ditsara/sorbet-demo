# typed: strong
# frozen_string_literal: true

# nodoc
class LineItem < ApplicationRecord
  belongs_to :account
  belongs_to :acct_transaction, class_name: 'Transaction', required: false

  validates_numericality_of :amount
end
