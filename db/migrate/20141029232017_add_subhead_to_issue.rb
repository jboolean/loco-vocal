class AddSubheadToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :subhead, :string
  end
end
