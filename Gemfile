source 'https://rubygems.org'


gem 'rails', '~> 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'config', '~> 1.3.0'

# User authentication and authorization
gem 'devise', '~> 4.2.0'
gem 'cancancan', '~> 1.15.0'

# Display/rendering
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'ajax-datatables-rails', '~> 0.3'
gem 'jquery-datatables-rails', '~> 3.4'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'timeliness', '~> 0.3.8'
gem 'validates_timeliness', '~> 4.0'
gem 'font-awesome-rails', '~> 4.7.0'

# Reporting
gem 'axlsx', '~> 2.1.0.pre'
gem 'axlsx_rails', '~> 0.5.0'

group :production do
  gem 'pg', '~> 0.19.0'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.12'
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-core', '~> 3.5.4'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1.1', require: false
  gem 'database_cleaner', '~> 1.5.3'
  gem 'factory_girl_rails', '~> 4.7.0'
  gem 'ffaker', '~> 2.2.0'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
