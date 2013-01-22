class StudyPlansController < ApplicationController
  def index
    @study_plans = StudyPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_plans }
    end
  before_filter :load_study_plan, except: [:index, :new, :create]
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_plan }
    end
  end

  def new
    @study_plan = StudyPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_plan }
    end
  end

  def edit; end

  def create
    @study_plan = StudyPlan.new(params[:study_plan])

    respond_to do |format|
      if @study_plan.save
        format.html { redirect_to @study_plan, notice: 'Study plan was successfully created.' }
        format.json { render json: @study_plan, status: :created, location: @study_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @study_plan.update_attributes(params[:study_plan])
        format.html { redirect_to @study_plan, notice: 'Study plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
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
