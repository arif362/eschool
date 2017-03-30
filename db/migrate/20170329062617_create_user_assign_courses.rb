class CreateUserAssignCourses < ActiveRecord::Migration
  def change
    create_table :user_assign_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :school_id

      t.timestamps null: false
    end
  end
end
