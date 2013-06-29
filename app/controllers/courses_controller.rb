class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  
  respond_to :js, :html
  
  def index
    if params[:query].present?
      @courses = Course.search(params)
    else
      @courses = Course.paginate(page: params[:page], :per_page => 20)
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = current_user.courses.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_user.courses.new(params[:course])
    Outline.create(:course_id => @course.id)

    respond_to do |format|
      if @course.save
        redirect_to @course, notice: 'Course was successfully created.'
      else
        render action: "new"
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
