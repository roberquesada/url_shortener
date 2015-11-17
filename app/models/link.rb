class Link < ActiveRecord::Base
  def self.search_by_short_url(params)
    find_by(short_url: params)
  end

  def self.generate_short_link

  end
end
