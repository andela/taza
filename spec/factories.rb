FactoryGirl.define do
  factory :the_team do
    name "abel"
    position "C.E.O"
    bio "hi, it's abel"
  end

  factory :user do
    sequence(:name) { |n| "User#{n}"}
    sequence(:image) { |n| "User#{n}"}
    sequence(:email) { |n| "email#{n}@andela.co" }
  end
end