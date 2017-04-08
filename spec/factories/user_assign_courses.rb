require 'faker'

FactoryGirl.define do
  factory :user_assign_course do
    course_id Faker::Number.number(1)
    user_id Faker::Number.number(1)
  end
end