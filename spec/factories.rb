FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| Faker::Lorem.word }
    borrower
  end

  factory :borrower do
    sequence(:name) {|n| Faker::Name.name }
    sequence(:email) {|n| Faker::Internet.email }
  end
end
