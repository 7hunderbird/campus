ActiveAdmin.register Task do

  index do
    column :title
    column :body
    column :complete
    default_actions
  end
  
end
