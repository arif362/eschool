class Course < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :klasses
  has_many :user_assign_courses
  has_many :users, through: :user_assign_courses

  def self.search(current_school, user_id)
    if user_id.present?
      user=User.find_by_id(user_id)
      user.courses
    else
      current_school.courses
    end

  end

end
