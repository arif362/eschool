class AddSaltAndHashedPasswordToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :salt, :string
    add_column :schools, :hashed_password, :string
  end
end
