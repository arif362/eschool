class AddCoursesIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :course_id, :integer
  end
end
