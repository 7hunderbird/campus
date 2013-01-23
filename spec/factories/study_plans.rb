FactoryGirl.define do
  factory :study_plan do
    name "Learn FactoryGirl"
  
    factory :invalid_study_plan do
      name nil
    end
  end
end
