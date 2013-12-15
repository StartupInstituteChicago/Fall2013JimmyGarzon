source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'therubyracer'
gem 'carmen-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'devise'
gem "recaptcha", :require => "recaptcha/rails"
gem 'omniauth'
gem 'omniauth-twitter'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
	gem 'better_errors'
	gem 'quiet_assets'
	gem 'rails_layout'
	gem 'pry-rails'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'awesome_print', :require => 'ap'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'dotenv-rails'
  gem 'sqlite3'
end

group :production do
	gem 'pg'
	gem 'rails_12factor'
	gem 'thin'
end