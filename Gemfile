source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.6', '>= 5.2.6.2'
gem 'rails-controller-testing', '>= 1.0.2'
gem 'haml-rails', '~> 1.0', '>= 1.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3', '>= 4.3.11'

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'jquery-rails', '>= 4.3.1'
gem 'autoprefixer-rails'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

gem 'pry'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '>= 4.8.2'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.5.1'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'webmock'
end