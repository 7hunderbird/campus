source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json', '~> 1.7.6'

# For Authentication
gem 'devise', '~> 2.2.0'

# Twitter Bootstrap Dependency
gem 'less-rails', '~> 2.2.6'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'jquery-rails', '~> 2.1.4'
  
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '~> 0.10.2', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'twitter-bootstrap-rails', '~> 2.2.0'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'rspec-rails', '~> 2.12.1'
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
end

group :production do
  gem 'pg', '~> 0.14.1'
end
