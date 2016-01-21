class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.boolean :read, default: false
      t.integer :entry_id
      t.references :flux, index: true

      t.timestamps null: false
    end
  end
end
