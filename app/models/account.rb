# frozen_string_literal: true

# nodoc
class Account < ApplicationRecord
  has_many :line_items
  validates_presence_of :name
end
