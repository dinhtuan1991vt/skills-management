class QualificationsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_qualification, only: [:edit, :update, :destroy]
  before_action :load_qualification_service, only: [:create, :update, :destroy, :new, :edit]

  # Show qualifications
  def index
    respond_to do |format|
      format.html
      format.json { render json: QualificationsDatatable.new(view_context) }
    end
  end

  # New qualification
  def new
    @qualification = Qualification.new
  end

  # Edit qualification
  def edit
  end

  # Create new qualification
  def create
    @qualification = Qualification.new(qualification_params)
    authorize! :create, @qualification

    respond_to do |format|
      if @qualification_service.save_qualification(@qualification)
        format.html { redirect_to qualifications_path, notice: I18n.t('qualifications.index.create_notice') }
      else
        flash[:alert] = @qualification.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  # Update qualification
  def update
    respond_to do |format|
      if @qualification_service.update_qualification(@qualification, qualification_params)
        format.html { redirect_to qualifications_path, notice: I18n.t('qualifications.index.update_notice') }
      else
        flash[:alert] = @qualification.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  # Delete qualification
  def destroy
    @qualification_service.destroy_qualification(@qualification)
    respond_to do |format|
      format.html { redirect_to qualifications_path, notice: I18n.t('qualifications.index.destroy_notice') }
    end
  end

  private
    # Set current qualification
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    # Get params
    def qualification_params
      params.require(:qualification).permit(:name, :status, :from_date, :to_date, :user_id)
    end

    # Load qualification service
    def load_qualification_service
      @qualification_service = QualificationService.new
    end
end