class SkillsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_skill, only: [:edit, :update, :destroy]
  before_action :set_category
  before_action :load_skill_service, only: [:create, :update, :destroy]

  def index
  end

  def new
    @skill = @category.skills.build
  end

  def edit
  end

  def create
    @skill = @category.skills.build(skill_params)
    authorize! :create, @skill

    respond_to do |format|
      if @skill_service.save_skill(@skill)
        format.html { redirect_to skill_categories_path, notice: I18n.t('skills.index.create_notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @skill_service.update_skill(@skill, skill_params)
        format.html { redirect_to skill_categories_path, notice: I18n.t('skills.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @skill_service.destroy_skill(@skill)
    respond_to do |format|
      format.html { redirect_to skill_categories_path, notice: I18n.t('skills.index.destroy_notice') }
    end
  end

  private
    # Set skill
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Set skill category
    def set_category
      @category = SkillCategory.find(params[:skill_category_id])
    end

    # Get params
    def skill_params
      params.require(:skill).permit(:name, :description)
    end

    # Load service
    def load_skill_service
      @skill_service = SkillService.new
    end
end
