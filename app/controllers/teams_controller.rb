class TeamsController < ApplicationController
	before_action :set_team, only: [:edit, :update, :destroy]
	before_action :load_team_service, only: [:create, :update, :destroy]
	load_and_authorize_resource except: [:create]

	# Show teams
	def index
		 respond_to do |format|
			format.html
			format.json { render json: TeamsDatatable.new(view_context) }
		end
	end

	# New team
	def new
		@team = Team.new
	end

	# Create new team
	def create
		@team = Team.new(team_params)
		authorize! :create, @team

		respond_to do |format|
			format.json {  }
			if @team_service.save_team(@team) &&
        @team_service.update_team_skills(@team, get_skill_ids_arr)
				format.html { redirect_to teams_path, notice: I18n.t('teams.index.create_notice') }
			else
				format.html { render :new }
			end
		end
	end

	# Update team
	def update
		respond_to do |format|
			if @team_service.update_team(@team, team_params) &&
         @team_service.update_team_skills(@team, get_skill_ids_arr)
				  format.html { redirect_to teams_path, notice: I18n.t('teams.index.update_notice') }
			else
				format.html { render :edit }
			end
		end
	end

	# Delete team
	def destroy
		@team_service.destroy_team(@team)
		respond_to do |format|
			format.html { redirect_to teams_path, notice: I18n.t('teams.index.destroy_notice') }
		end
	end

	private
		# Set current team
		def set_team
			@team = Team.find(params[:id])
		end

		# Get params
		def team_params
			params.require(:team).permit(:name, :parent_id, :skill_ids)
		end

		# Load service
		def load_team_service
			@team_service = TeamService.new
		end

    # Get skill-ids array
    def get_skill_ids_arr
      team_params[:skill_ids].split(",")
    end

end