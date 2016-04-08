source 'https://rubygems.org'

gemspec

gem 'inflecto'

group :development, :test do
  gem 'rom-sql', '~> 0.7.0'
end

group :development do
  gem 'dry-equalizer', '~> 0.2'
  gem 'sqlite3', platforms: [:mri, :rbx]
  gem 'jdbc-sqlite3', platforms: :jruby
end

group :test do
  gem 'anima', '~> 0.2.0'
  gem 'rspec'
  gem 'byebug', platforms: :mri
  gem 'pg', platforms: [:mri, :rbx]
  gem 'pg_jruby', platforms: :jruby
  gem 'codeclimate-test-reporter', require: nil
end

group :benchmarks do
  gem 'benchmark-ips'
end

group :tools do
  gem 'pry'
end
