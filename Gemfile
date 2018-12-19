source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

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
  gem 'letter_opener_web'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails-i18n'
gem 'jquery-ui-rails' 

# パスワードハッシュ化
gem 'bcrypt', '~> 3.1.7'

# 画像アップロード
gem 'carrierwave'

# アップロードした画像のサイズ変更
gem 'mini_magick'

gem 'data-confirm-modal', github: 'ifad/data-confirm-modal'
gem 'jquery-rails'

# ページング機能
gem 'kaminari'
# ページング機能のBootstrap
gem 'kaminari-bootstrap'
# ログイン機能
gem 'devise'