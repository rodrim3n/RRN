# -*- encoding: utf-8 -*-
# stub: nido 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nido"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michel Martens"]
  s.date = "2015-08-04"
  s.description = "It is a design pattern in key-value databases to use the key to simulate structure, and Nido can take care of that."
  s.email = ["michel@soveran.com"]
  s.homepage = "http://github.com/soveran/nido"
  s.rubygems_version = "2.4.5"
  s.summary = "Structured keys helper"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<cutest>, [">= 0"])
    else
      s.add_dependency(%q<cutest>, [">= 0"])
    end
  else
    s.add_dependency(%q<cutest>, [">= 0"])
  end
end
