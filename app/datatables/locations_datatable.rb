class LocationsDatatable < BaseDatatable
  delegate :edit_location_path, to: :@view

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Location.count,
      iTotalDisplayRecords: locations.total_entries,
      aaData: data
    }
  end

private
  # Map locations to data
  def data
    locations.map do |location|
      edit_path = link_to(fa_icon('edit lg'), edit_location_path(location))
      delete_path = link_to(fa_icon('trash-o lg'), location, method: :delete, data: { confirm: I18n.t('locations.index.delete_confirm') })
      [
        location.name,
        location.latitude,
        location.longitude,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def locations
    @locations ||= fetch_locations
  end

  def fetch_locations
    locations = Location.order("#{sort_column} #{sort_direction}")
    locations = locations.page(page).per_page(per_page)

    if params["search"]["value"].present?
      locations = locations.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    locations
  end

  def sort_column
    columns = %w[name latitude longitude]
    super columns
  end
end