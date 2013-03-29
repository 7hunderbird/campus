class HomeworksController < ApplicationController
  
  #todo: remove js format since it is not being used
  respond_to :html, :js
  
  def index
  end
  
  def complete
    @homework = Homework.find(params[:id])

    #todo: handle redirect or repsponder if updating attrs is successful and if unsuccessful
    respond_with @homework
    #@homework.update_attribute(:completed, true)
  end
end
