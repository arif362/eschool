class Course < ActiveRecord::Base
  belongs_to :school
  has_many :klasses

  def self.selected_course
    courses =self.all
    course_title=courses.collect{|course| [course.title, course.id] }
  end

  #course_name = Course.new
  COURSE_NAMES = self.selected_course

end
