class CreateSchoolhouses < ActiveRecord::Migration
  def change
    create_table :schoolhouses do |t|
      t.string :name
      t.string :level
      t.integer :enrollment

      t.timestamps null: false
    end
  end
end
