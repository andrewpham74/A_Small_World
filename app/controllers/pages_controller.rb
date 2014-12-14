class PagesController < ApplicationController
  def home
  end
  
  #def about
  #end

  def terms_of_service
  end

  def privacy_policy
  end

# new userprofile controller to display user profile + the pics he or she uploaded on the left and 
# pics from countries they have selected to see
def  user_profile
  @pins = Pin

  if current_user.countries_to_see.include?("All")
    @pins = @pins.all
  else
    @pins = @pins.where("country IN (?)", current_user.countries_to_see)
  end

  if current_user.interest_ids.any?
    @pins += @pins.select {|pin| (current_user.interest_ids & pin.interest_ids).any? }
  end
  @pins=@pins-current_user.pins
  @country_and_interest_pins = @pins.paginate(:page => params[:page], :per_page => 8)
end

def my_pins
  @my_pins = current_user.pins.order('created_at DESC').paginate(page: params[:page], per_page: 8)
end

  def north_america
  	@pins = Pin.where(continent: "North America").paginate(:page => params[:page], :per_page => 8)

  	# render :template => "pages/america"
  end

  def south_america
    @pins = Pin.where(continent: "South America").paginate(:page => params[:page], :per_page => 8)
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

  def video_purchasing
    @products = Product.all
  end

end
