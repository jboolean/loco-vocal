class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :yob
      t.integer :gender
      t.references :my_town, index: true
      t.references :party, index: true

      t.timestamps
    end
  end
end
