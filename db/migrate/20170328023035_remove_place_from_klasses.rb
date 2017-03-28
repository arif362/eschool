class RemovePlaceFromKlasses < ActiveRecord::Migration
  def change
    remove_column :klasses, :place
  end
end
