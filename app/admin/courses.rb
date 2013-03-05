ActiveAdmin.register Course do
  
  index do
    column :name
    column :description
    column :url
    default_actions
  end

end
