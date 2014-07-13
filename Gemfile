# encoding: UTF-8
source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 2.3.2.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '= 3.0.1' # forcing version see next line
# gem 'bcrypt' # '=3.1.7' was not recognized
# my gem
gem 'voteable_dave_jul', '>= 0.0.3'
# to use local gem has to be an absolute path
# gem 'voteable_dave_jul', '>= 0.0.3', path: /home/huffd/Sites/voteable-gem
# do not forget config/application.rb
# "config.autoload_paths += %W(#{config.root}/lib)"
gem 'sluggable_dave_jul', '>= 0.0.1'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'quiet_assets'
  gem 'pry'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
