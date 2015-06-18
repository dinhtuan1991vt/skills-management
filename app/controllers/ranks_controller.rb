class RanksController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_rank, only: [:edit, :update, :destroy]
  before_action :load_rank_service, only: [:create, :update, :destroy]

  # Show ranks
  def index
     respond_to do |format|
      format.html
      format.json { render json: RanksDatatable.new(view_context) }
    end
  end

  # New rank
  def new
    @rank = Rank.new
  end

  # Create new rank
  def create
    @rank = Rank.new(rank_params)
    authorize! :create, @rank

    respond_to do |format|
      format.json {  }
      if @rank_service.save_rank(@rank) &&
        @rank_service.update_rank_skills(@rank, skill_ids)
        format.html { redirect_to ranks_path, notice: I18n.t('ranks.index.create_notice') }
      else
        format.html { render :new }
      end
    end
  end

  # Update rank
  def update
    respond_to do |format|
      if @rank_service.update_rank(@rank, rank_params) &&
         @rank_service.update_rank_skills(@rank, skill_ids)
          format.html { redirect_to ranks_path, notice: I18n.t('ranks.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  # Delete rank
  def destroy
    @rank_service.destroy_rank(@rank)
    respond_to do |format|
      format.html { redirect_to ranks_path, notice: I18n.t('ranks.index.destroy_notice') }
    end
  end

  private
    # Set current rank
    def set_rank
      @rank = Rank.find(params[:id])
    end

    # Get params
    def rank_params
      params.require(:rank).permit(:name)
    end

    # Load service
    def load_rank_service
      @rank_service = RankService.new
    end

    # Get skill-ids array
    def skill_ids
      params.require(:rank)[:skill_ids].split(",")
    end

end