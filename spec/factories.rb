FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@andela.co" }
  end
end