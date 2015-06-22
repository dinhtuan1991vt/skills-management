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


  private
    # Set current assess
    def set_supervisor
      @supervisor = User.find(params[:supervisor_id])
    end

    # Set current assess
    def set_staff
      @staff = User.find(params[:staff_id])
    end

    # Load service
    def load_assess_service
      @assess_service = AssessService.new
    end

end