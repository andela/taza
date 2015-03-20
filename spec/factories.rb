FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "User#{n}"}
    sequence(:image) { |n| "User#{n}"}
    sequence(:email) { |n| "email#{n}@andela.co" }
  end


  factory :team_member do
    sequence(:name) { |n| "Name#{n}"}
    sequence(:position) { |n| "Position#{n}"}
    sequence(:image) { |n| "Image#{n}"}
    sequence(:bio) { |n| "Bio#{n}"}
  end
end