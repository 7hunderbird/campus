class StudyPlansController < ApplicationController
  # GET /study_plans
  # GET /study_plans.json
  def index
    @study_plans = StudyPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_plans }
    end
  end

  # GET /study_plans/1
  # GET /study_plans/1.json
  def show
    @study_plan = StudyPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_plan }
    end
  end

  # GET /study_plans/new
  # GET /study_plans/new.json
  def new
    @study_plan = StudyPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_plan }
    end
  end

  # GET /study_plans/1/edit
  def edit
    @study_plan = StudyPlan.find(params[:id])
  end

  # POST /study_plans
  # POST /study_plans.json
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

  # PUT /study_plans/1
  # PUT /study_plans/1.json
  def update
    @study_plan = StudyPlan.find(params[:id])

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

  # DELETE /study_plans/1
  # DELETE /study_plans/1.json
  def destroy
    @study_plan = StudyPlan.find(params[:id])
    @study_plan.destroy

    respond_to do |format|
      format.html { redirect_to study_plans_url }
      format.json { head :no_content }
    end
  end
end
