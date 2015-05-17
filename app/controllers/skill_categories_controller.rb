class SkillCategoriesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :load_skill_category_service, only: [:index, :create, :update, :destroy]

  # Show skill categories and skills
  def index
    respond_to do |format|
      format.html
      format.json { render json: @skill_category_service.get_hierarchy }
    end
  end

  # New skill category
  def new
    @category = SkillCategory.new
  end

  # Create new skill category
  def create
    @category = SkillCategory.new(category_params)
    authorize! :create, @category

    respond_to do |format|
      if @skill_category_service.save_skill_category(@category)
        format.html { redirect_to skill_categories_path, notice: I18n.t('skill_categories.index.create_notice') }
      else
        flash[:alert] = @category.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  # Update skill category
  def update
    respond_to do |format|
      if @skill_category_service.update_skill_category(@category, category_params)
        format.html { redirect_to skill_categories_path, notice: I18n.t('skill_categories.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  # Delete skill category
  def destroy
    @skill_category_service.destroy_skill_category(@category)
    respond_to do |format|
      format.html { redirect_to skill_categories_path, notice: I18n.t('skill_categories.index.destroy_notice') }
    end
  end

  private
    # Set current category
    def set_category
      @category = SkillCategory.find(params[:id])
    end

    # Get params
    def category_params
      params.require(:skill_category).permit(:name, :parent_id)
    end

    # Load service
    def load_skill_category_service
      @skill_category_service = SkillCategoryService.new
    end
end