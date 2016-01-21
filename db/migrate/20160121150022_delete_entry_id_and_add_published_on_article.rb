class DeleteEntryIdAndAddPublishedOnArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :entry_id
    add_column :articles, :published, :datetime
  end
end
