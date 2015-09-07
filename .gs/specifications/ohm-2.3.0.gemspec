# -*- encoding: utf-8 -*-
# stub: ohm 2.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ohm"
  s.version = "2.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michel Martens", "Damian Janowski", "Cyril David"]
  s.date = "2015-08-06"
  s.description = "Ohm is a library that allows to store an object in Redis, a persistent key-value database. It has very good performance."
  s.email = ["michel@soveran.com", "djanowski@dimaion.com", "me@cyrildavid.com"]
  s.homepage = "http://soveran.github.io/ohm/"
  s.licenses = ["MIT"]
  s.rubyforge_project = "ohm"
  s.rubygems_version = "2.4.5"
  s.summary = "Object-hash mapping library for Redis."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redic>, ["~> 1.5.0"])
      s.add_runtime_dependency(%q<nido>, [">= 0"])
      s.add_runtime_dependency(%q<stal>, [">= 0"])
      s.add_runtime_dependency(%q<msgpack>, ["~> 0.5.0"])
      s.add_development_dependency(%q<cutest>, [">= 0"])
    else
      s.add_dependency(%q<redic>, ["~> 1.5.0"])
      s.add_dependency(%q<nido>, [">= 0"])
      s.add_dependency(%q<stal>, [">= 0"])
      s.add_dependency(%q<msgpack>, ["~> 0.5.0"])
      s.add_dependency(%q<cutest>, [">= 0"])
    end
  else
    s.add_dependency(%q<redic>, ["~> 1.5.0"])
    s.add_dependency(%q<nido>, [">= 0"])
    s.add_dependency(%q<stal>, [">= 0"])
    s.add_dependency(%q<msgpack>, ["~> 0.5.0"])
    s.add_dependency(%q<cutest>, [">= 0"])
  end
end
