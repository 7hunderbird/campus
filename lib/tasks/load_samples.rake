# lib/tasks/load_samples.rake
namespace :db do
  desc "Load the sample data from db/sample"
  task :load_samples => :environment do

    # Add db/sample directory to the load path
    sample_dir = File.join(Rails.root, 'db', 'sample')
    $LOAD_PATH.unshift(sample_dir)

    # Require any ruby files in db/sample
    Dir[File.join(sample_dir, "*.rb")].each do |file|
      puts "-- Loading from file: #{file}"
      require File.basename(file)
    end
  end
end