class AddDataToWords < ActiveRecord::Migration
  def change
    add_column :words, :data, :text
  end
end
