class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
