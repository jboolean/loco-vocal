class AddTownToIssue < ActiveRecord::Migration
  def change
    add_reference :issues, :town, index: true
  end
end
