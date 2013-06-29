10.times do |i| 
  attrs = {name: "course #{i}", url: "http://url #{i}", description: "description of course #{i}"}
  Course.create(attrs)
end

