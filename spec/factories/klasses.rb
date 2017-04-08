require 'faker'

FactoryGirl.define do
  factory :klass do
    time '3.30'
    room_no Faker::Number.number(3)
    email Faker::Internet.email
    duration '1.50'
  end
end