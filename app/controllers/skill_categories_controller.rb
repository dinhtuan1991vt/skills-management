class SkillCategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = SkillCategory.order("id desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @category = SkillCategory.new
  end

  def create
    @category = SkillCategory.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to skill_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to skill_categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to skill_categories_path, notice: 'Category was successfully deleted.' }
    end
  end

  private
    def set_category
      @category = SkillCategory.find(params[:id])
    end

    def category_params
      params.require(:skill_category).permit(:name, :parent_id)
    end
end