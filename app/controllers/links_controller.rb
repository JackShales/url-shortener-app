class LinksController < ApplicationController
  def index
    @links = Link.all
    render 'index.html.erb'
  end
end
