class Dashboard::ProfilesController < ApplicationController
  layout 'dashboard'
  before_action :check_current_user
  def new
    if check_profile.blank?
      @profile = Profile.new
    else
    redirect_to dashboard_index_url
    end
  	
  end

   def edit
      @profile = Profile.find_by_user_id(current_user)
  end

  def create
  	@profile = Profile.new(params_profile)

  	if @profile.save
  		redirect_to dashboard_profile_url(current_user)
  	end


  end

  def index
      redirect_to dashboard_profile_url(current_user)
  end
def update

  @profile = Profile.find_by_user_id(current_user)

 if @profile.update(params_profile)

    flash[:notice] = "Success Update Records"

    redirect_to action: 'index'

 else

    flash[:error] = "data not valid"

    render 'edit'

 end

 end

  
  def show
       @profile = Profile.find_by_user_id(current_user)
   end

  private
            def params_profile
                params.require(:profile).permit(:user_id, :name, :last_name, :about, :image, :status, :gender, :jobdesk)
            end
end
