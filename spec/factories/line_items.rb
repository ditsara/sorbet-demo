# typed: false
FactoryBot.define do
  factory :line_item do
    narrative { "MyString" }
    amount { "9.99" }
    account { nil }
    transaction { nil }
  end
end
