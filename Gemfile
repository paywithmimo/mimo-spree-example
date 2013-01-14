source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'sqlite3', group: [:development, :test]
gem 'mysql2', '~> 0.3.11', group: [:staging, :producion]

gem 'jquery-rails'
gem 'spree', :git => 'git://github.com/spree/spree.git', :tag => '1-2-stable'
gem 'spree_mimo', :git => 'git@github.com:paywithmimo/mimo-spree.git'
gem 'spree_promo'
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise.git'
gem 'spree_last_address', :git => "git://github.com/dancinglightning/spree-last-address.git"
gem 'devise-encryptable'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'capistrano', '~> 2.11.2'
  gem 'capistrano-ext', '1.2.1'
  gem 'rvm-capistrano', '~> 1.1.0'
end

group :development, :test do
  gem 'rspec-rails'
end
