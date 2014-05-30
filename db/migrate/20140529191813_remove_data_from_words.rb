class RemoveDataFromWords < ActiveRecord::Migration
  def up
    remove_column :words, :data
  end

  def down
    add_column :words, :data, :text
  end
end
