require 'faker'

FactoryGirl.define do
  factory :course do
    title Faker::Book.title
    author Faker::Book.author
  end
end