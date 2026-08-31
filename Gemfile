source "https://rubygems.org"

gem "puma"
gem "sqlite3"
gem "propshaft"

alchemy_cms_version = ENV.fetch("ALCHEMY_CMS_VERSION", "8.3")

gem "alchemy_cms", "~> #{alchemy_cms_version}"
gem "alchemy-devise", "~> #{alchemy_cms_version}"
gem "ruby-vips", "~> 2.0"

# Specify your gem's dependencies in alchemy-solid_errors.gemspec.
gemspec

rails_version = ENV.fetch("RAILS_VERSION", "8.0")
gem "rails", "~> #{rails_version}.0"

gem "standard", "~> 1.44"
gem "github_changelog_generator", require: false
gem "gem-release", require: false
