source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :development, :test do
  gem 'capistrano', '~> 2.11.2'
  gem 'capistrano-ext', '1.2.1'
  gem 'rvm-capistrano', '~> 1.1.0'
  gem 'sqlite3'
end

group :staging, :production do
  gem 'mysql2', '~> 0.3.11'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'spree', :git => 'git://github.com/spree/spree.git', :tag => '1-2-stable'
gem 'spree_mimo', :git => 'git@github.com:stackbuilders/spree_mimo.git'
gem 'spree_promo'
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise.git'
gem 'spree_last_address', :git => "git://github.com/dancinglightning/spree-last-address.git"