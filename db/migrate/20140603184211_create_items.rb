class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :merchant_id
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
