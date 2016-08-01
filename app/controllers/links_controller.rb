class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.where(user_id: current_user.id)
    render 'index.html.erb'
  end

  def new
    @link = Link.new
    render 'new.html.erb'
  end

  def create
    @link = Link.new(
      slug: params[:slug],
      target_url: params[:target],
      user_id: current_user.id
    )
    if @link.save
      redirect_to '/links'
    else
      render 'new.html.erb'
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    if current_user.id == @link.user_id
      render 'show.html.erb'
    else
      redirect_to '/links'
    end
  end

  def edit
    @link = Link.find_by(id: params[:id])
    if current_user.id == @link.user_id
      render 'edit.html.erb'
    else
      redirect_to '/links'
    end
  end

  def update
    @link = Link.find_by(id: params[:id])
    if @link.update(
      slug: params[:slug],
      target_url: params[:target],
      user_id: current_user.id
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
