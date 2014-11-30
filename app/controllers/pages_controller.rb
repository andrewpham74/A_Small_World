class PagesController < ApplicationController
  def home
  end
  def about
  end

  def terms_of_service
  end

  def privacy_policy
  end

# new userprofile controller to display user profile + the pics he or she uploaded on the left and 
# pics from countries they have selected to see
def  user_profile
  @country_and_interest_pins = Pin.where("country = ? OR interest = ?", current_user.countries_to_see, current_user.user_interest).paginate(:page => params[:page], :per_page => 8)
end

def my_pins
  @my_pins = current_user.pins.paginate(page: params[:page], per_page: 8)
end

  def america
  	@pins = Pin.where(continent: "America").paginate(:page => params[:page], :per_page => 8)

  	# render :template => "pages/america"
  end

  def europe
  	@pins = Pin.where(continent: "Europe").paginate(:page => params[:page], :per_page => 8)
  end

  def africa
  	@pins = Pin.where(continent: "Africa").paginate(:page => params[:page], :per_page => 8)
  end

  def asia
  	@pins = Pin.where(continent: "Asia").paginate(:page => params[:page], :per_page => 8)
  end

  def australia
  	@pins = Pin.where(continent: "Australia").paginate(:page => params[:page], :per_page => 8)
  end

  def antartica
  	@pins = Pin.where(continent: "Antartica").paginate(:page => params[:page], :per_page => 8)
  end

end
