class AddParentToTown < ActiveRecord::Migration
  def change
    add_column :towns, :parent, :reference
  end
end
