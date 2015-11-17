class Link < ActiveRecord::Base
  def self.search_by_short_url(params)
    find_by(short_url: params)
  end

  def self.generate_short_link
    letters_min = ('a'..'z').to_a
    letters_may = ('A'..'Z').to_a
    letters = letters_min + letters_may
    short_url = ""

    3.times do |letter|
      short_url += letters[rand(0..50)]
    end

    short_url
  end

  def self.check_protocol(url)
    if url.match(/^(https?:\/\/)/) == nil
      false
    else
      true
    end    
  end

  def self.exist_url_shortened(url)
    link = find_by(original_url: url)
    if link.blank?
      generate_short_link
    else
      link.short_url
    end
  end

  def update_visited
    current_visited = visited
    update(visited: (current_visited + 1))
  end

  def self.list_most_visited(number_items)
    order('visited DESC').limit(number_items)
  end
end
