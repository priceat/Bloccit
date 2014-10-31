class RemoveRpsecsTable < ActiveRecord::Migration
  def up
    drop_table :rspecs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
