#samples = Array.new(5) {|i| {name: 'course #{i}', url: 'http://url #{i}', description: 'description of course #{i}'}}

#samples.each do |sample|
#  Course.create(sample)
#end

1000.times do |i| 
  attrs = {name: "course #{i}", url: "http://url #{i}", description: "description of course #{i}"}
  Course.create(attrs)
end

#run bundle exec rake db:load_samples # app rake task to load sample data