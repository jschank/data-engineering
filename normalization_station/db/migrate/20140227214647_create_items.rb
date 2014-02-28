class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price
      t.references :merchant, index: true

      t.timestamps
    end
  end
end
