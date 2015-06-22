class AssessesDatatable < BaseDatatable
  delegate :assesses_details_path, :t, to: :@view

  def initialize(view, supervisor)
    super(view)
    @supervisor = supervisor;
    @assesses_count = Assess.select(:user_id).joins(:user).where(supervisor_id: @supervisor.id).distinct.count
  end

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: @assesses_count,
      iTotalDisplayRecords: assesses.total_entries,
      aaData: data
    }
  end

private
  # Map assesses to data
  def data
    assesses.map do |assess|
      email = assess.user.email unless assess.user.nil?
      details_path = link_to(t('assesses.staffs.assess-now'), assesses_details_path(@supervisor.id, assess.user.id), class: "btn btn-warning")
        [
          email,
          "#{details_path}"
        ]
    end
  end

  def assesses
    @assesses ||= fetch_assesses
  end

  def fetch_assesses
    case sort_column
      when "email"
        assesses = Assess.select(:user_id).joins(:user).where(supervisor_id: @supervisor.id).distinct
      else
        assesses = Assess.order("#{sort_column} #{sort_direction}")
    end

    assesses = assesses.page(page).per_page(per_page)

    if params["search"]["value"].present?
      assesses = assesses.where("email like :search", search: "%#{params["search"]["value"]}%")
    end
    assesses
  end

  def sort_column
    columns = %w[email]
    super columns
  end
end