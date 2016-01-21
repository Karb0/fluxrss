class Flux < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  before_create :generate_title_and_description
  MAX_ARTICLES = 4

  def generate_title_and_description
    self.title = (Feedjira::Feed.fetch_and_parse url).title
    self.description = (Feedjira::Feed.fetch_and_parse url).description
  end

  def actus
    posts = []
    (Feedjira::Feed.fetch_and_parse url).entries.first(MAX_ARTICLES).each do |entry|
      find = false
      self.articles.each do |article|
        if article.published == entry.published
          find = true
          posts << article
        end
      end
      if !find
        posts << Article.create(flux_id: self.id, published: entry.published, title: entry.title, url: entry.url)
      end
    end
    clean_articles
    posts
  end

  private 

  def clean_articles
    if self.articles.count > MAX_ARTICLES
      
    end
  end

end
