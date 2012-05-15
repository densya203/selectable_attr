# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "selectable_attr"
  s.version = "0.3.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Takeshi Akima"]
  s.date = "2012-05-14"
  s.description = "selectable_attr generates extra methods dynamically for attribute which has options"
  s.email = "akm2000@gmail.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gemtest",
    ".travis.yml",
    "Gemfile",
    "MIT-LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "init.rb",
    "install.rb",
    "lib/selectable_attr.rb",
    "lib/selectable_attr/base.rb",
    "lib/selectable_attr/enum.rb",
    "lib/selectable_attr/version.rb",
    "selectable_attr.gemspec",
    "spec/selectable_attr_base_alias_spec.rb",
    "spec/selectable_attr_enum_spec.rb",
    "spec/selectable_attr_i18n_spec.rb",
    "spec/spec_helper.rb",
    "tasks/selectable_attr_tasks.rake",
    "uninstall.rb"
  ]
  s.homepage = "http://github.com/akm/selectable_attr/"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.12"
  s.summary = "selectable_attr generates extra methods dynamically"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_development_dependency(%q<autotest>, [">= 0"])
      s.add_development_dependency(%q<rdiscount>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_dependency(%q<bundler>, ["~> 1.1.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_dependency(%q<autotest>, [">= 0"])
      s.add_dependency(%q<rdiscount>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<yard>, ["~> 0.7.2"])
    s.add_dependency(%q<bundler>, ["~> 1.1.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
    s.add_dependency(%q<autotest>, [">= 0"])
    s.add_dependency(%q<rdiscount>, [">= 0"])
  end
end

