ActiveAdmin.register Assignment do
  
  index do
    column :name
    column :description
    column :due_date
    column :url
    default_actions
  end
  

end
