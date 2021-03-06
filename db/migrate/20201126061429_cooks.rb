class Cooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|
      t.string :title , null: false
      t.text :text, null: false
      t.text :resipe, null: false
      t.integer :category_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
