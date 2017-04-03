class RemoveTeacherFromKlasses < ActiveRecord::Migration
  def change
    remove_column :klasses, :teacher, :string
  end
end
