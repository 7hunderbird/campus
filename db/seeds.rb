# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#Seed data for assignment
#Assignment.create(:due_date => '12/1/2012', :title => "How to pick up chicks", :url => 'http://www.google.com')

#Seed data for course

#Course.create(:description => 'How to be awesome at Rails', :name => 'Joe Reis', :url =>'http://awesomenessandstuff.com')

#Seed data for study_plan
#StudyPlan.create(:due_date => '1/1/2013', :name => 'Study Plan Test')

# Loads seed data out of the bodyworks db/default dir
default_path = File.join(File.dirname(__FILE__), 'default')

Rake::Task['db:load_dir'].reenable
Rake::Task['db:load_dir'].invoke(default_path)