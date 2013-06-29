class HomeworksController < ApplicationController

  respond_to :html, :js

  def index
    @homeworks = Homework.where(:user_id => current_user.id)
  end

  #ajax request that responds with js.erb file
  def complete
    @homework = Homework.find(params[:id])
    @homework.update_attribute(:completed, true)
    #respond_with(@homework)
  end
end
