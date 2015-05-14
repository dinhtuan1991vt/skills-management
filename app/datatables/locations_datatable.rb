class LocationsDatatable
  delegate :params, :h, :link_to, :fa_icon, :edit_location_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Location.count,
      iTotalDisplayRecords: locations.total_entries,
      aaData: data
    }
  end

private

  def data
    locations.map do |location|
      [
        location.name,
        location.latitude,
        location.longitude,
        link_to(fa_icon('edit lg'), edit_location_path(location)) + " " + link_to(fa_icon('trash-o lg'), location, method: :delete, data: { confirm: I18n.t('locations.index.delete_confirm') })
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

  def page
    params["start"].to_i/per_page + 1
  end

  def per_page
    params["length"].to_i > 0 ? params["length"].to_i : 10
  end

  def sort_column
    columns = %w[name latitude longitude]
    columns[params["order"]["0"]["column"].to_i]
  end

  def sort_direction
    params["order"]["0"]["dir"] == "desc" ? "desc" : "asc"
  end
end