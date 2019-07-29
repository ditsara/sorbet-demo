# typed: false
FactoryBot.define do
  factory :account do
    name { "MyString" }
    code { "MyString" }
    account_type { 1 }
    archived { false }
  end
end
