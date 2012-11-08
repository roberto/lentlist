FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| "Item #{n}" }
    borrower
  end

  factory :borrower do
    sequence(:name) {|n| "Name #{n}" }
    sequence(:email) {|n| "email#{n}@example.com" }
  end
end
