class Course < ActiveRecord::Base
  has_many :course_klass_lists

  def selected_course
    courses=Course.all
    course_title=courses.collect{|course| course.title }
  end

  course_name= Course.new
  COURSE_NAMES=  course_name.selected_course

end
