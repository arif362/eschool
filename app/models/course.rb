class Course < ActiveRecord::Base
  has_many :course_klass_lists

  COURSE_NAMES= ['Ruby on Rails', 'Jave', 'PHP']
  validates :course, :inclusion => COURSE_NAMES
end
