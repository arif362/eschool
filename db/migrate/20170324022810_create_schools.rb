class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :registration_no
      t.string :country
      t.string :admin
      t.string :email
      t.string :mobile

      t.timestamps null: false
    end
  end
end
