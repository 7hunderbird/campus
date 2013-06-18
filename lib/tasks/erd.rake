# 
# Usage:
#
#     rake campus:erd                  # runs erd rake task with proper args
#     rake campus:db:version           # print schema version number
#
# This task is just a shortcut to the task provided by the rails-erd gem. It
# adds the proper args to the erd task to make it easy to re-generate the
# diagram when the schema changes
namespace :campus do
  desc "[CAMPUS] Generates entity relationship diagram with proper args"
  task :erd => :environment do
    # bundle exec rake erd filename='doc/erd' title='campus Domain Model (schema version number)'
    schema_version = ActiveRecord::Migrator.current_version.to_s

    ENV["filename"] = "doc/erd"
    ENV["title"] = "Campus Domain Model (#{schema_version})"
    Rake::Task["erd"].invoke
  end

  namespace :db do
    task :version => :environment do
      puts ActiveRecord::Migrator.current_version.to_s
    end
  end
end
