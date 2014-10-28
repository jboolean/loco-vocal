class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up
      t.references :issue, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
