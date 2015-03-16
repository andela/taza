FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User#{n}"}
    sequence(:image) { |n| "User#{n}"}
    sequence(:email) { |n| "email#{n}@andela.co" }
  end
end