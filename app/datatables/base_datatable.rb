class BaseDatatable
  delegate :params, :link_to, :fa_icon, to: :@view

  def initialize(view)
    @view = view
  end

protected
  # Get current page
  def page
    params["start"].to_i/per_page + 1
  end

  # Get number of items per page
  def per_page
    params["length"].to_i > 0 ? params["length"].to_i : 10
  end

  # Get index of sort column
  def sort_column(columns)
    columns[params["order"]["0"]["column"].to_i]
  end

  # Get direction of sort column
  def sort_direction
    params["order"]["0"]["dir"] == "desc" ? "desc" : "asc"
  end
end