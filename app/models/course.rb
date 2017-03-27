class Course < ActiveRecord::Base
 belongs_to :school
 has_many :klasses
 belongs_to :user

  def selected_course
    courses=Course.all
    course_title=courses.collect{|course| [course.title, course.id] }
  end

  course_name= Course.new
  COURSE_NAMES=  course_name.selected_course

end
