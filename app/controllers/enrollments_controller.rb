class EnrollmentsController < ApplicationController
  
  respond_to :html
  
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
    @course = Course.find(params[:id])
    @enrollment = Enrollment.new(:course_id => @course.id, :user_id => current_user.id)
    @enrollment.save
    @course.assignments.each do |a|
      Homework.create(:user_id => current_user.id, :assignment_id => a.id, :enrollment_id => @enrollment.id)
    end
    flash[:notice] = "You are now enrolled in this course!"
    redirect_to course_path(@enrollment.course_id)
  end
end
