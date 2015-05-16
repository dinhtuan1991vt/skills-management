class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]
  before_action :load_team_service, only: [:create, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
     respond_to do |format|
      format.html
      format.json { render json: TeamsDatatable.new(view_context) }
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    authorize! :create, @team

    respond_to do |format|
      if @team_service.save_team(@team)
        format.html { redirect_to teams_path, notice: I18n.t('teams.index.create_notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @team_service.update_team(@team, team_params)
        format.html { redirect_to teams_path, notice: I18n.t('teams.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team_service.destroy_team(@team)
    respond_to do |format|
      format.html { redirect_to teams_path, notice: I18n.t('teams.index.destroy_notice') }
    end
  end

  private
    # Set team
    def set_team
      @team = Team.find(params[:id])
    end

    # Get params
    def team_params
      params.require(:team).permit(:name)
    end

    # Load service
    def load_team_service
      @team_service = TeamService.new
    end

end