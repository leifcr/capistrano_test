source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
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
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  # gem 'capistrano-monit_runit', path: File.expand_path('../../capistrano-monit_runit', __FILE__)
  # gem 'capistrano-monit_runit', git: 'git@github.com:leifcr/capistrano-monit_runit.git', branch: 'capistrano3'
  # gem 'capistrano-pumaio', git: 'git@github.com:leifcr/capistrano-puma.git'
  gem 'capistrano-monit_runit', path: '../capistrano-monit_runit'
  gem 'capistrano-pumaio', path: '../capistrano-puma'
end
