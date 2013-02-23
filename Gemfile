source 'http://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json', '~> 1.7.7'

# For Authentication
gem 'devise', '~> 2.2.3'

# For Authorization
gem 'cancan'

# Twitter Bootstrap Dependency
gem 'less-rails', '~> 2.2.6'

# Exception notification
gem 'airbrake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'jquery-rails', '~> 2.2.1'
  
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '~> 0.10.2', :platforms => :ruby

  # TODO: Why is this 1.0.3 when the latest is 1.3.0?
  gem 'uglifier', '>= 1.0.3'

  gem 'twitter-bootstrap-rails', '~> 2.2.4'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# Pagination for easier search
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'

# Search with elasticsearch (backend) and tire (gem)
gem 'tire'

# To use debugger
# gem 'ruby-debug'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'rspec-rails', '~> 2.12.1'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.1.0'
  gem 'shoulda-matchers', '~> 1.4.2'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'pry'
  gem 'pry-nav'
  gem 'awesome_print'
  gem 'letter_opener_web', '1.0.0.rc3'
  gem 'foreman'
  gem 'meta_request', '0.2.1'
end

group :production do
  gem 'pg', '~> 0.14.1'
end
