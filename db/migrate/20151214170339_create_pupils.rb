class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :grade
      t.timestamps null: false
    end
  end
end
