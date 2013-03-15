class EnrollmentsController < ApplicationController
  
  respond_to :js, :html
  
  def index
    @courses = Course.joins(:enrollments => :user)
  end
  
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    flash[:notice] = "The course '#{@enrollment.course.name}' was dropped from your schedule."
    redirect_to courses_path
  end
  
  def update
    
  end
  
  def course
    @enrollment = Enrollment.new(:course_id => params[:id], :user_id => current_user.id)
    @enrollment.save
    flash[:notice] = "You are now enrolled in this course!"
    redirect_to course_path(@enrollment.course_id)
  end
end
