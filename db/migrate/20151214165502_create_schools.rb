class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
