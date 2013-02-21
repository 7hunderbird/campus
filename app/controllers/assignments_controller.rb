class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  
  before_filter :parent_course
  
  def parent_course
    @course = Course.find(params[:course_id])
  end
  
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = @course.assignments.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = @course.assignments.new(params[:assignment])
    @assignment.save
    @outline = Outline.where("course_id = ?", @course.id).all
    @outline.empty? ? i = 1 : i = @outline.sort_by {|x| x.order_number}.last.order_number += 1
    @content = Outline.new(:course_id => @course.id, :content_type => 'Assignment', :order_number => i, :content_id => @assignment.id)
    @content.save
    
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to edit_course_path(@course), notice: 'Assignment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to course_path(@course), notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    Outline.where("content_id = ? AND content_type = ?", @assignment.id, 'Assignment').first.destroy

    respond_to do |format|
      format.html { redirect_to edit_course_path(@course), notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
