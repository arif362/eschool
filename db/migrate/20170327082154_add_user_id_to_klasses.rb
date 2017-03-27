class AddUserIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :user_id, :integer
  end
end
