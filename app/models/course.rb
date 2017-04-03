class Course < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  has_many :user_assign_courses
  has_many :users, through: :user_assign_courses

=begin
  def self.selected_course
    courses =self.all
    course_title=courses.collect{|course| [course.title, course.id] }
  end


  COURSE_NAMES = self.selected_course
=end

end
