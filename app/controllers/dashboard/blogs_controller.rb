class Dashboard::BlogsController < ApplicationController
	layout 'dashboard'
  before_action :check_current_user
  def new
  @blog = Blog.new
  end
  

  def index
  @blogs = Blog.order("updated_at DESC")
  end
  

  def create
    @blog = Blog.new(params_blog)

      if @blog.save

        flash[:notice] = "Success Add Records"

        redirect_to action: 'index'

      else

        flash[:error] = "data not valid"

        render 'new'

    end
  end

  def edit

      @blog = Blog.find_by_id(params[:id])

  end

  def update

  @blog = Blog.find_by_id(params[:id])

 if @blog.update(params_blog)

    flash[:notice] = "Success Update Records"

    redirect_to action: 'index'

 else

    flash[:error] = "data not valid"

    render 'edit'

 end

 end

#   def new
#   @article = Article.new

# end


# def import

# valid_keys= ["id","title","content","status"]

# total_row = 0
#     spreadsheet = Article.open_spreadsheet(params[:file])

#     # spreadsheet.sheets.each_with_index do |sheet, index|
#     #   spreadsheet.default_sheet = spreadsheet.sheets[index]
# # byebug
#       header = Array.new
#       spreadsheet.row(1).each { |row| header << row.downcase.tr(' ', '_') }
#       (2..spreadsheet.last_row).each do |i|
#         row = Hash[[header, spreadsheet.row(i)].transpose]
#           data = Article.create(row)


# spreadsheet.default_sheet= spreadsheet.sheets.last

#  header = Array.new
#       spreadsheet.row(1).each { |row| header << row.downcase.tr(' ', '_') }
#       (2..spreadsheet.last_row).each do |i|
#         row = Hash[[header, spreadsheet.row(i)].transpose]
#         data=row.to_hash.slice(*valid_keys)
#           #user_id=Article.all.select(:id)
# # accesible=["id","content"]

#     # comment= row.to_hash.slice(accesible)
#     # byebug

#                comment = Article.last.comments.create(data)


#     @articles=Article.all.order(:created_at).page(params[:page]).per(5)
#     @comments = Comment.all

# end




#       # end

# end




#   redirect_to root_url, notice: "Products imported."
# end




  def destroy

@blog = Blog.find_by_id(params[:id])

if @blog.destroy

  flash[:notice] = "Success Delete a Records"

  redirect_to action: 'index'

else

  flash[:error] = "fails delete a records"

  redirect_to action: 'index'

end

end



  def show

       @blog = Blog.find_by_id(params[:id])

      
   end


private

def params_blog

params.require(:blog).permit(:title, :content, :category, :image)

end

end
