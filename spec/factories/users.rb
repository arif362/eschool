require 'faker'
FactoryGirl.define do
  factory :user do
    user_name Faker::Name.name
    password 'password'
  end
end