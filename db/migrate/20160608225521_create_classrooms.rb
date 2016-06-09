class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :teacher
      t.integer :size
      t.belongs_to :schoolhouse

      t.timestamps null: false
    end
  end
end
