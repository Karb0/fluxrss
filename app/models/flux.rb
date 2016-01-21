class Flux < ActiveRecord::Base
  belongs_to :user
  before_create :generate_title_and_description

  def generate_title_and_description
    self.title = (Feedjira::Feed.fetch_and_parse url).title
    self.description = (Feedjira::Feed.fetch_and_parse url).description
  end

  def actus
    (Feedjira::Feed.fetch_and_parse url).entries.first(2)
  end

end
