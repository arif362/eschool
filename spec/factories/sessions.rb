require 'faker'

FactoryGirl.define do
  factory :session do
    user_name Faker::Name.name
    password 'password'
  end
end