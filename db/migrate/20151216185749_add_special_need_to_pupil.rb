class AddSpecialNeedToPupil < ActiveRecord::Migration
  def change
    add_column :pupils, :special, :boolean
  end
end
