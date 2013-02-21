FactoryGirl.define do
  factory :study_plan do
    name "Learn FactoryGirl"
  
    factory :invalid_study_plan do
      name nil
    end

    factory :study_plan_with_user do
      association :user
    end
  end
end
