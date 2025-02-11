class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code ,      null: false
      t.integer :prefecture_id,  null: false
      t.string :cities ,         null: false
      t.string :housenumber ,    null: false
      t.string :build   
      t.string :tel ,            null: false
      t.references :purchase,   foreign_key: true , null: false
      t.timestamps
    end
  end
end