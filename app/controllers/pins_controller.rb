class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:continent] or params[:country] or params[:interests]
      @pins = Pin.all

      if params[:continent].present? and params[:continent] != 'All'
        @pins = @pins.where(continent: params[:continent])
      end

      if params[:country].present? and params[:country] != 'All'
        @pins = @pins.where(country: params[:country])
      end

      if params[:interest].present? and params[:interest] != 'All'
        @pins = @pins.joins(:interests).where(interests: { name: params[:interest] })
      end

      @pins = @pins.paginate(:page => params[:page], :per_page => 8)
    else
      @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def selection
    @pins = Pin.where(continent: params[:continent], interest: params[:interest], country: params[:country]).paginate(:page => params[:page], :per_page => 8)
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.build
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.build(pin_params)
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
      else
        render action: 'new' 
      end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
      redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end
  
  def correct_user
    @pin = Pin.find(params[:id])
    unless @pin.user == current_user or current_user.admin?
      redirect_to pins_path, notice: "Not authorized to edit this pin"
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :country, :continent, :interest, interest_ids: [])
    end
end
