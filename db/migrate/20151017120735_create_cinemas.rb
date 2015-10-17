class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name
      t.string :address
      t.string :webpage
      t.string :promotion_name
      t.string :promotion_desc
      t.boolean :enabled

      t.timestamps null: false
    end
    add_index :cinemas, :name, unique: true
    add_index :cinemas, :webpage, unique: true
  end
end
