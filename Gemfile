source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'bootstrap-sass'
gem 'bootswatch-rails'

gem 'simple_form'
gem 'rails_bootstrap_navbar'
gem 'kaminari'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem "factory_girl_rails"
  gem "capybara"
end


group :development do
  gem 'annotate'

  #guard
  gem "guard"
  gem "guard-rspec"
  gem 'terminal-notifier'
  gem 'guard-pow'
end

group :metrics do
  gem 'simplecov', :require => false
  gem 'rails_best_practices', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
