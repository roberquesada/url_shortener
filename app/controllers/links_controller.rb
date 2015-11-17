class LinksController < ApplicationController
  def index

    url = Link.search_by_short_url(params[:shortlink])
    if url.blank?
      render(:text => 'Short url not found')
    else
      redirect_to(url.original_url)
    end

  end
end
