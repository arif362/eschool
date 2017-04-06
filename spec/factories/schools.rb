require 'faker'

FactoryGirl.define do
  factory :school do
    name Faker::Name.name
    email Faker::Internet.email
    password 'password'
  end
end