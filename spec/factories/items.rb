# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    title "MyString"
    url "MyString"
    desc "MyText"
    variety "MyString"
    library_id 1
  end
end
