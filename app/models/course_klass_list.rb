class CourseKlassList < ActiveRecord::Base
  belongs_to :klass
  belongs_to :course
end
