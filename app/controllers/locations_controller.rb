class LocationsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_location, only: [:edit, :update, :destroy]
  before_action :load_location_service, only: [:create, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: LocationsDatatable.new(view_context) }
    end
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    authorize! :create, @location

    respond_to do |format|
      if @location_service.save_location(@location)
        format.html { redirect_to locations_path, notice: I18n.t('locations.index.create_notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @location_service.update_location(@location, location_params)
        format.html { redirect_to locations_path, notice: I18n.t('locations.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @location_service.destroy_location(@location)
    respond_to do |format|
      format.html { redirect_to locations_path, notice: I18n.t('locations.index.destroy_notice') }
    end
  end

  private
    # Set location
    def set_location
      @location = Location.find(params[:id])
    end

    # Get params
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end

    # Load location service
    def load_location_service
      @location_service = LocationService.new
    end
end
