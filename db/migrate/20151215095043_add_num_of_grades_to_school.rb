class AddNumOfGradesToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :num_of_grades, :integer 
  end
end
