class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,               null: false
      t.text :item_description,     null: false
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :load_id,            null: false
      t.integer :area_id,            null: false
      t.integer :delivery_id,        null: false
      t.integer :selling_price,      null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
