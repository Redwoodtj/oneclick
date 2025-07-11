source 'http://rubygems.org'
ruby '2.1.7'

gem 'rails', '7.1.0'

gem 'sprockets', '4.2.0'
# gem 'sass-rails', '~> 4.0.3'
gem 'sass-rails', github: 'camsys/sass-rails', tag: 'v4.0.3a'

gem 'bootstrap-sass', github: 'camsys/bootstrap-sass', tag: '3.2.0.CS.2'
gem 'simple_form', '~> 3.1.0.rc1', github: 'camsys/simple_form', branch: 'cs-3.0'

gem 'translation_engine', github: 'derekedwards/translation_engine'
#Switched to custom translation engine that doesn't do inline help.  Inline help was duplicated in 1-click
#gem 'translation_engine', github: 'camsys/translation_engine'

gem 'fog', '>= 1.37.0'
gem 'coffee-rails', '>= 4.2.2'
gem 'uglifier', '>= 1.0.3'
gem 'bootstrap-combobox'
gem 'jquery-rails', '>= 4.0.1'
gem 'cancan'
gem 'devise', '>= 4.7.0'
gem 'figaro'
gem 'geocoder'
gem 'haml-rails', '>= 1.0.0'
gem 'pg'
gem 'rolify'
gem 'thin', '>= 2.0.0'
gem 'puma'
gem "rack-timeout"
gem 'awesome_print'
gem 'chronic'
gem 'mechanize', '>= 2.7.3'
gem 'activemodel'
gem 'newrelic_rpm'
gem 'polylines'
gem 'activemdb'
gem 'draper', '>= 1.4.0'
gem 'rubyzip'
gem 'lorem-ipsum-me'
gem 'faraday_middleware'
gem 'twilio-ruby'
gem 'rails_12factor', group: [:integration, :production, :qa, :staging]
gem 'font-awesome-sass'
gem 'twitter-typeahead-rails', github: 'camsys/twitter-typeahead-rails'
gem 'handlebars_assets', '>= 0.17.2'
gem 'simple_token_authentication', '>= 1.18.0'
gem 'Indirizzo'
gem 'momentjs-rails', '~> 2.6.0'
gem 'bootstrap3-datetimepicker-rails', '= 3.0.0.1'
gem 'active_model_serializers', '>= 0.8.2'
gem 'jquery-datatables-rails', '~> 2.1.10.0.3'
gem 'ajax-datatables-rails', '> 0.1.2'
gem 'active_attr', '>= 0.15.1'
gem 'twitter-bootstrap-rails-confirm', github: 'bluerail/twitter-bootstrap-rails-confirm', branch: 'bootstrap3'
gem 'activerecord-postgis-adapter', '= 3.1.2'
gem 'rgeo-activerecord', '>= 6.2.0'
gem 'rgeo'
gem 'rgeo-shapefile'
gem 'rgeo-geojson'
gem 'leaflet-rails', github: 'camsys/leaflet-rails'
gem 'mini_magick'
gem 'carrierwave', '>= 0.11.0'
gem 'poltergeist', '>= 1.11.0'
gem 'sidekiq'
gem 'ransack', github: 'camsys/ransack'
gem 'kaminari', '>= 0.17.0'
gem 'bootstrap-kaminari-views'
gem 'browser'
gem 'remotipart', '~> 1.2'
gem 'savon', '>= 2.15.0'
gem 'attr_encrypted'
gem 'uber-ruby', '>= 0.10.0', require: 'uber'
gem 'StreetAddress', github: 'derrek/street-address'

group :development do
  # gem 'ffi-geos'
  #gem 'mysql2'
  gem 'better_errors', '>= 2.0.0'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'html2haml', '>= 2.2.0'
  gem 'quiet_assets', '>= 1.1.0'
  gem 'listen', '>= 2.0.0'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', '>= 0.9.7', :require=>false
  gem 'sextant'
  gem 'rails-erd', '>= 1.3.0'
  gem 'growl'
  gem 'travis', '>= 1.6.12'
  gem "letter_opener", ">= 1.3.0"
  gem 'yard'
  gem 'RedCloth' # Needed by yard
  gem 'foreman'
  # For sidekiq monitoring
  gem 'sinatra', '>= 2.0.0', :require => nil
  gem 'seed_dump', '>= 3.2.4'
end

group :development, :test do
  gem 'factory_girl_rails', '>= 4.5.0'
end

group :test do
  gem 'rspec-core', '~> 2.14.0'
  gem 'rspec-rails', '>= 2.99.0'
  gem 'capybara', '>= 2.9.2'
  gem 'cucumber-rails', '>= 3.0.0', :require=>false
  gem 'database_cleaner'
  gem 'email_spec', '>= 2.0.0'
  gem 'launchy'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'timecop'
end

