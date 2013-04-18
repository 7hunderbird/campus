module ApplicationHelper

  def my_study_plans
    if current_user
      link_to 'My Study Plans', user_study_plans_path(current_user), :style => 'color: green'
    end   
  end

  # Taken from sample_app/app/helpers/sessions_helper.rb
  def current_user?(user)
    user == current_user
  end
end
