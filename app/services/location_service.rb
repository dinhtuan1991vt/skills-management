class LocationService < BaseService
  # Save location
  def save_location(location)
    location.save
  end

  # Update location
  def update_location(location, params)
    location.update(params)
  end

  # Delete location
  def destroy_location(location)
    location.destroy
  end
end