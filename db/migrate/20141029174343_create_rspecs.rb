class CreateRspecs < ActiveRecord::Migration
  def change
    create_table :rspecs do |t|

      t.timestamps
    end
  end
end
