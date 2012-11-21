FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| Faker::Lorem.word }
    archived_at nil

    factory :item_with_borrower do
      borrower
    end

    factory :invalid_item do
      title nil
    end

    factory :archived_item do
      archived_at { Time.local_time(2010, 8, 15) }
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

    factory :invalid_borrower do
      name nil
    end
  end
end
