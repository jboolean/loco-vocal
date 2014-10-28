class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.text :intro
      t.string :image_url
      t.references :issues, index: true

      t.timestamps
    end
  end
end
