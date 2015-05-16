class LocationService < BaseService
  def save_location(location)
    location.save
  end

  def update_location(location, params)
    location.update(params)
  end

  def destroy_location(location)
    location.destroy
  end
end