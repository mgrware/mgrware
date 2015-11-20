class BlogsController < ApplicationController
    respond_to 'html'
  def index
    # @blogs = Blog.search(params[:search])
      @blog = Blog.order("id DESC").limit(5)
      
      @blogs = Blog.paginate(:page => params[:page], :per_page => 5).search(params[:search])
      
      if params[:search]
      @blogs = Blog.paginate(:page => params[:page], :per_page => 5).search(params[:search]).order("id DESC")
    #   @blogs = Blog.search(params[:search]).order("created_at DESC")
      else
      @blogs = Blog.paginate(:page => params[:page], :per_page => 5).order("id DESC")
    #   @blogs = Blog.order("created_at DESC")
     end
  end
    
  #   def index
  #   respond_to do |format|
  #     format.json do
  #       page = params[:page].present? ? params[:page] : 1
  #       @blogs = Blog.paginate(:page => page, :per_page => 5).search(params[:search])
  #       @blog = Blog.order("id DESC").limit(3)
  #       render :json => Paginator.pagination_attributes(@blogs).merge!(:blogs => @blogs)
  #     end
  #     format.html
  #   end
  # end
  

  def new
  end

  def edit
  end

  def show

       @blog = Blog.find_by_id(params[:id])
   end

end
