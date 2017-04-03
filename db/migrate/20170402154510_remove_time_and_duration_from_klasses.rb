class RemoveTimeAndDurationFromKlasses < ActiveRecord::Migration
  def change
    remove_column :klasses, :time, :time
    remove_column :klasses, :duration, :time
  end
end
