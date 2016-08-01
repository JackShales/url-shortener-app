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
    @link = Link.new(
      slug: params[:slug],
      target_url: params[:target]
    )
    if @link.save
      redirect_to '/links'
    else
      render 'new.html.erb'
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @link = Link.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @link = Link.find_by(id: params[:id])
    if @link.update(
      slug: params[:slug],
      target_url: params[:target]
    )
      redirect_to "/links/#{@link.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @link = Link.find_by(id: params[:id])
    @link.destroy
    redirect_to '/links'
  end
end
