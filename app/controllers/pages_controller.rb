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
    if params[:country] or params[:interests]
      @pins = Pin.where(continent: "North America")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
      @pins = Pin.where(continent: "North America").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def south_america
        if params[:country] or params[:interests]
      @pins = Pin.where(continent: "South America")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
    @pins = Pin.where(continent: "South America").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def europe
        if params[:country] or params[:interests]
      @pins = Pin.where(continent: "Europe")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
    @pins = Pin.where(continent: "Europe").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def africa
        if params[:country] or params[:interests]
      @pins = Pin.where(continent: "Africa")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
    @pins = Pin.where(continent: "Africa").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def asia
        if params[:country] or params[:interests]
      @pins = Pin.where(continent: "Asia")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
    @pins = Pin.where(continent: "Asia").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def australia
        if params[:country] or params[:interests]
      @pins = Pin.where(continent: "Australia")

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
    @pins = Pin.where(continent: "Australia").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def video_purchasing
    @products = Product.all
  end

end
