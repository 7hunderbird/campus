ActiveAdmin.register StudyPlan do

  index do
    column :name
    column :due_date
    default_actions
  end
  
end
