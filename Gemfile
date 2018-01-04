source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',         '~> 5.1.4'
gem 'sqlite3'
gem 'puma',          '~> 3.7'
gem 'sass-rails',    '~> 5.0'
gem 'uglifier',      '>= 1.3.0'
gem 'coffee-rails',  '~> 4.2'
gem 'turbolinks',    '~> 5'
gem 'jbuilder',      '~> 2.5'
gem 'devise'
gem 'bcrypt', '~> 3.1.11', platforms: [:ruby, :x64_mingw, :mingw]
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'rubocop'
gem 'rb-inotify', github: 'nex3/rb-inotify', platforms: :ruby, require: false
gem 'wdm', platforms: :mingw, require: false

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]