class AssessesController < ApplicationController
  load_and_authorize_resource
  before_action :set_supervisor, only: [:staffs, :details]
  before_action :set_staff, only: [:details]
  before_action :load_assess_service, only: [:staffs, :details]


  # Show assesses
  def staffs
    respond_to do |format|
      @assess_service.update_assess_data(@supervisor)
      format.html
      format.json { render json: AssessesDatatable.new(view_context, @supervisor) }
    end
  end

  def details
    # TO DO: show list of skill to assess and submit it
  end


  # Update assess
  def update
    respond_to do |format|
      if @assess_service.update_assess(@assess, assess_params) &&
          @assess_service.set_role(@assess, get_role)
        if is_custom_skill_set
          format.html { redirect_to custom_skills_assess_path(@assess)}
        else
          format.html { redirect_to assesses_path, notice: I18n.t('assesses.index.update_notice') }
        end
      else
        flash[:alert] = @assess.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  private
    # Set current assess
    def set_supervisor
      @supervisor = User.find(params[:supervisor_id])
    end

    # Set current assess
    def set_staff
      @staff = User.find(params[:staff_id])
    end


    # Get params
    def assess_params
      params.require(:assess).permit(:email, :password, :password_confirmation, :first_name, :sur_name, :location_id, :status, :team_id, :skill_set, :rank_id)
    end
    # Load service
    def load_assess_service
      @assess_service = AssessService.new
    end

end