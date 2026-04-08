source "https://rubygems.org"

gem "puma"
gem "sqlite3"

alchemy_cms_version = ENV.fetch("ALCHEMY_CMS_VERSION", "8.0")
if alchemy_cms_version.start_with?("8.")
  gem "propshaft"
end

gem "alchemy_cms", "~> #{alchemy_cms_version}"
devise_version = (Gem::Version.new(alchemy_cms_version) >= Gem::Version.new("8.0")) ? "8.0" : alchemy_cms_version
gem "alchemy-devise", "~> #{devise_version}"

# Specify your gem's dependencies in alchemy-solid_errors.gemspec.
gemspec

rails_version = ENV.fetch("RAILS_VERSION", "8.0")
gem "rails", "~> #{rails_version}.0"

gem "standard", "~> 1.44"
gem "github_changelog_generator", require: false
gem "gem-release", require: false
