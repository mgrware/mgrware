class GalleriesController < ApplicationController
  def index
  	@blogs = Blog.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  def show
  end

  def new
  end

  def edit
  end
end
