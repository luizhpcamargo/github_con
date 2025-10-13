source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'rails-controller-testing', '>= 1.0.3'
gem 'haml-rails', '~> 2.0', '>= 2.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'jquery-rails', '>= 4.3.2'
gem 'autoprefixer-rails'
gem 'sass-rails', '~> 5.0', '>= 5.0.8'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

gem 'pry'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '>= 4.10.0'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.6.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'webmock'
end