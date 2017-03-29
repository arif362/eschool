class Course < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  has_many :user_assign_courses
  has_many :users, through: :user_assign_courses

  def selected_course
    courses = Course.all
    course_title=courses.collect{|course| [course.title, course.id] }
  end

  course_name = Course.new
  COURSE_NAMES = course_name.selected_course

end
