require "bundler/setup"

require "bundler/gem_tasks"

require "rspec/core"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

Bundler::GemHelper.install_tasks

namespace :spec do
  desc "Prepares database for testing"
  task :db_prepare do
    system "cd spec/dummy; RAILS_ENV=test bin/rake db:setup db:seed; cd -"
  end
end

# add changelog task
require "github_changelog_generator/task"

# Temporary fix for SSL error
# Ref: https://github.com/ruby/openssl/issues/949#issuecomment-3367944960
require "openssl"
s = OpenSSL::X509::Store.new.tap(&:set_default_paths)
begin
  OpenSSL::SSL::SSLContext.send(:remove_const, :DEFAULT_CERT_STORE)
rescue
  nil
end
OpenSSL::SSL::SSLContext.const_set(:DEFAULT_CERT_STORE, s.freeze)

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = "sitediver"
  config.project = "alchemy-solid_errors"
  config.future_release = "v#{Alchemy::SolidErrors::VERSION}"
end