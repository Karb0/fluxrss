class Flux < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  before_create :generate_title_and_description

  def generate_title_and_description
    self.title = (Feedjira::Feed.fetch_and_parse url).title
    self.description = (Feedjira::Feed.fetch_and_parse url).description
  end

  def actus
    (Feedjira::Feed.fetch_and_parse url).entries.first(4).each do |entry|
      find = false
      self.articles.each do |article|
        if article.published == entry.published
          find = true
        end
      end
      if !find
        Article.create(flux_id: self.id, published: entry.published)
      end
    end
  end

end
