source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable and sidekiq in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'sidekiq', '~> 6.2'
gem 'devise', '~> 4.8'
gem 'devise_token_auth', '~> 1.1'
gem 'graphql', '~> 1.12'
gem 'graphql_playground-rails'
gem "omniauth", "~> 2.0"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem 'omniauth-github'
# gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'
# gem 'omniauth-apple'
gem 'hasura_handler', git: 'https://github.com/woohoou/HasuraHandler.git'
gem "graphql-client", "~> 0.17.0"
gem 'active_model_otp', '~> 2.2'
gem 'twilio-ruby', '~> 5.54'
gem "onesignal-ruby", "~> 0.5.0"
gem "acts_as_paranoid", "~> 0.7.3"
gem "cancancan", "~> 3.3"
gem "activeadmin", "~> 2.9"
gem "aldous", "~> 1.1"
gem "audited", "~> 5.0"
gem "doorkeeper", "~> 5.5"
gem "doorkeeper-grants_assertion", "~> 0.3.1"
gem "octokit", "~> 4.21"
gem "active_model_serializers", "~> 0.10.12"
gem 'dotenv-rails', '~> 2.7'
gem "data_migrate", "~> 8.0"
gem "rack-cors", "~> 1.1"
gem "jwt", "~> 2.2"
gem "securerandom", "~> 0.2.0"
gem "google-api-client", "~> 0.53.0"
gem "koala", "~> 3.2"
gem "exponent-server-sdk", "~> 0.1.0"
gem "aws-sdk-s3", "~> 1.114", require: false
gem "sentry-ruby", "~> 5.4"
gem "sentry-rails", "~> 5.4"
gem "enumerize", "~> 2.5"
gem "rails-i18n", "~> 7.0"
gem "devise-i18n", "~> 1.10"
gem "aasm", "~> 5.4"
gem "mjml-rails", "~> 4.8"
gem "haml-rails", "~> 2.1"
gem "faraday", "~> 1.7"
gem "nanoid", "~> 2.0"
gem "httparty", "~> 0.21.0"
gem "mobility", "~> 1.2"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker'
  gem 'rspec-rails', '~> 5.0'
  gem 'webmock'
  gem "email_spec", "~> 2.2"
  gem 'simplecov', require: false
  gem 'database_cleaner-active_record'
  gem 'yard'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-yard'
  gem 'rubocop', '~> 1.35'
  gem "rubocop-rails", "~> 2.18", require: false
  gem 'reek'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem "html2haml", "~> 2.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '3.1.1'
  gem 'spring-commands-rspec'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

