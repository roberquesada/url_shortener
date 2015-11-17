class LinksController < ApplicationController
  
  def index
    @urls = Link.all
  end

  def check

    url = Link.search_by_short_url(params[:shortlink])
    if url.blank?
      render(:text => 'Short url not found')
    else
      url.update_visited
      redirect_to(url.original_url)
    end
  end

  def most_visited
    @pages = Link.list_most_visited(10)
  end

end
