class QualificationsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_qualification, only: [:edit, :update, :destroy]

  def index
    @qualifications = Qualification.order("id desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @qualification = Qualification.new
  end

  def edit
  end

  def create
    @qualification = Qualification.new(qualification_params)
    authorize! :create, @qualification

    respond_to do |format|
      if @qualification.save
        format.html { redirect_to qualifications_path, notice: 'Qualification was successfully created.' }
      else
        flash[:alert] = @qualification.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        format.html { redirect_to qualifications_path, notice: 'Qualification was successfully updated.' }
      else
        flash[:alert] = @qualification.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
    @qualification.destroy
    respond_to do |format|
      format.html { redirect_to qualifications_path, notice: 'Qualification was successfully deleted.' }
    end
  end

  private
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    def qualification_params
      params.require(:qualification).permit(:name, :status, :from_date, :to_date, :user_id)
    end
end