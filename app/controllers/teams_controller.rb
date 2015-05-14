class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]
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
      if @team.save
        format.html { redirect_to teams_path, notice: 'Team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_path, notice: 'Team was successfully deleted.' }
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end

end