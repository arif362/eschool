class AddTeacherIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :teacher_id, :integer
  end
end
