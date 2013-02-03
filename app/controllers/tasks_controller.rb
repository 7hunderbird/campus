class TasksController < ApplicationController
  
  before_filter :get_assignment, :get_course
  
  def index
    @tasks = @assignment.tasks.all
  end

  def new
    @task = @assignment.tasks.build
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to course_assignment_task_path(@course, @assignment, @task), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to course_assignment_path(@course, @assignment), notice: 'Task successfully destroyed.' }
    end
  end
  
  def create
    respond_to do |format|
      if !@assignment.nil?
        @task = @assignment.tasks.build(params[:task])
        if @assignment.save
          format.html { redirect_to course_assignment_task_path(@course, @assignment, @task), notice: 'Task was successfully created.' }
        else
          render :action => 'new'
        end
      end
    end
  end
  
  def get_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end
  
  def get_course
    @course = Course.find(params[:course_id])
  end
  
end
