source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'puma'

gem 'delayed_job'
gem 'delayed_job_active_record'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :development do
  # Use Capistrano for deployment
  gem 'capistrano-rails', require: false
  gem 'rvm1-capistrano3', require: false
  # gem 'capistrano-monit_runit', path: '../capistrano-monit_runit', require: false
  # gem 'capistrano-pumaio', path: '../capistrano-puma', require: false
  # gem 'capistrano-delayed_job', path: '../capistrano-delayed_job', require: false
  gem 'capistrano-monit_runit', require: false
  gem 'capistrano-pumaio', require: false
  gem 'capistrano-delayed_job', require: false
end
