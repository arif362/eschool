class AddSchoolIdToCourseKlassLists < ActiveRecord::Migration
  def change
    add_column :course_klass_lists, :school_id, :integer
  end
end
