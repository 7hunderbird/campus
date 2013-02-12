require 'spec_helper'

describe 'routing to assignments' do
  
  it 'routes course_assignments_path to assignments#index' do
    course_assignments_path(1).should == '/courses/1/assignments'
  end
  
  it 'routes course_assignment_path() to assignments#show' do
    course_assignment_path(1,1).should == '/courses/1/assignments/1'
  end
  
  it 'routes new_course_assignment_path() to assignments#new' do
    new_course_assignment_path(1).should == '/courses/1/assignments/new'
  end
  
  it 'routes edit_course_assignment_path() to assignments#edit' do
    edit_course_assignment_path(1,1).should == '/courses/1/assignments/1/edit'
  end
end