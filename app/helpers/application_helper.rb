module ApplicationHelper

  def my_study_plans
    if current_user
      link_to 'My Study Plans', user_study_plans_path(current_user), :style => 'color: green'
    end   
  end

end
