class CreateCourseKlassLists < ActiveRecord::Migration
  def change
    create_table :course_klass_lists do |t|
      t.integer :course_id
      t.integer :klass_id

      t.timestamps null: false
    end
  end
end
