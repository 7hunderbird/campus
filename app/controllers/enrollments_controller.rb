class EnrollmentsController < ApplicationController
  
  def index
    @courses = Course.joins(:enrollments => :user)
  end
  
  def destroy
    
  end
  
  def update
    
  end
  
  def course
    binding.pry
    @enrollment = Enrollment.new(:course_id => params[:id], :user_id => current_user.id)
    @enrollment.save
    flash[:notice] = "You are now enrolled in this course!"
    redirect_to course_path(@enrollment.course_id)
  end
end
