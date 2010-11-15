# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rspec_table_matchers/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rspec_table_matchers"
  s.version     = RSpecTableMatchers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Toni Tuominen']
  s.email       = ['toni@piranhadigital.fi']
  s.homepage    = "http://rubygems.org/gems/rspec_table_matchers"
  s.summary     = "Set of matchers for RSpec and Capybara to aid working with tables."
  s.description = ""

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rspec_table_matchers"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
