ActiveAdmin.register Outline do
  
  index do
    column :order_number
    column :course_id
    column :content_type
    column :content_id
    default_actions
  end
  
end
