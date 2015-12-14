class AddSchoolRefToPupil < ActiveRecord::Migration
  def change
    add_reference :pupils, :school, index: true, foreign_key: true
  end
end
