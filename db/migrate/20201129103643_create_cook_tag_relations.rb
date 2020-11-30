class CreateCookTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :cook_tag_relations do |t|
      t.references :cook, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
