class CourseKlassList < ActiveRecord::Base
  belongs_to :klass
  belongs_to :course
  belongs_to :school
  belongs_to :user
end
