class StudyPlansController < ApplicationController
  def index
    @study_plans = StudyPlan.all
  respond_to :html, :json

  before_filter :load_study_plan, except: [:index, :new, :create]
    respond_with @study_plans
  end

  def show
    respond_with @study_plan
  end

  def new
    @study_plan = StudyPlan.new
    respond_with @study_plan
  end

  def edit; end

  def create
    @study_plan = StudyPlan.new(params[:study_plan])
    flash[:notice] = "Study plan was successfully created." if @study_plan.save
    respond_with @study_plan
  end

  def update
    # sets assoc if updating from nested resource (/users/:user_id/study_plans/:id)
    if params[:user_id]
      @user = User.find(params[:user_id])
      @study_plan.user = @user
    end

    flash[:notice] = "Study plan was successfully updated" if @study_plan.update_attributes(params[:study_plan])
    respond_with @study_plan
  end

  def destroy
    @study_plan.destroy

    respond_to do |format|
      format.html { redirect_to study_plans_url }
      format.json { head :no_content }
    end
  end

  private

  def load_study_plan
    @study_plan = StudyPlan.find(params[:id])
  end
end
