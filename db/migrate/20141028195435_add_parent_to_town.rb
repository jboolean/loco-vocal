class AddParentToTown < ActiveRecord::Migration
  def change
    add_column :towns, :parent_id, :integer
  end
end
