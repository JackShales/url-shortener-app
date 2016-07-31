class LinksController < ApplicationController
  def index
    @links = Link.all
    render 'index.html.erb'
  end

  def new
    @link = Link.new
    render 'new.html.erb'
  end

  def create
    link = Link.new(
      slug: params[:slug],
      target_url: params[:target]
    )
    link.save
    redirect_to '/links'
  end
end
