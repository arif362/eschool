class RemoveCourseFromKlasses < ActiveRecord::Migration
  def change
    remove_column :klasses, :course
  end
end
