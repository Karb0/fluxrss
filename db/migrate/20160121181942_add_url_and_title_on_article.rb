class AddUrlAndTitleOnArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :url, :string
  end
end
