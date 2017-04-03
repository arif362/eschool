class RenameTeacherIdToKlasses < ActiveRecord::Migration
  def change
    rename_column :klasses, :teacher_id, :user_id
  end
end
