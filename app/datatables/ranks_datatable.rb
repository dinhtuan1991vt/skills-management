class RanksDatatable < BaseDatatable
  delegate :edit_rank_path, to: :@view

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Rank.count,
      iTotalDisplayRecords: ranks.total_entries,
      aaData: data
    }
  end

private
  # Map ranks to data
  def data
    ranks.map do |rank|
      edit_path = link_to(fa_icon('edit lg'), edit_rank_path(rank))
      delete_path = link_to(fa_icon('trash-o lg'), rank, method: :delete, data: { confirm: I18n.t('ranks.index.delete_confirm') })
      [
        rank.name,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def ranks
    @ranks ||= fetch_ranks
  end

  def fetch_ranks
    ranks = Rank.order("#{sort_column} #{sort_direction}")
    ranks = ranks.page(page).per_page(per_page)

    if params["search"]["value"].present?
      ranks = ranks.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    ranks
  end

  def sort_column
    columns = %w[name]
    super columns
  end
end