class DropDefinitionsTable < ActiveRecord::Migration
  def up
  	drop_table :definitions
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
