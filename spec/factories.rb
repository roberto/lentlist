FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| Faker::Lorem.word }

    factory :item_with_borrower do
      borrower
    end
  end

  factory :borrower do
    sequence(:name) {|n| Faker::Name.name }
    sequence(:email) {|n| Faker::Internet.email }
    
    factory :borrower_with_items do
      after(:build) do |borrower, evaluator|
        borrower.items = build_list(:item, 3) if borrower.items.blank?
      end
    end
  end
end
