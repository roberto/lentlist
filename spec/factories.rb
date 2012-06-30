FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| "Item #{n}" }
    sequence(:borrower) {|n| "Borrower #{n}"}
  end
end