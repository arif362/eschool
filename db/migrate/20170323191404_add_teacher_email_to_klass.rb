class AddTeacherEmailToKlass < ActiveRecord::Migration
  def change
    add_column :klasses, :email, :string
  end
end
