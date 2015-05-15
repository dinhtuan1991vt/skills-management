class SkillsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_skill, only: [:edit, :update, :destroy]
  before_action :set_category

  def index
    respond_to do |format|
      format.html
      format.json { render json: SkillsDatatable.new(view_context) }
    end
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
      if @skill.save
        format.html { redirect_to skill_categories_path, notice: 'Skill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skill_categories_path, notice: 'Skill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skill_categories_path, notice: 'Skill was successfully deleted.' }
    end
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def set_category
      @category = SkillCategory.find(params[:skill_category_id])
    end

    def skill_params
      params.require(:skill).permit(:name, :description)
    end
end
