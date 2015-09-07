# -*- encoding: utf-8 -*-
# stub: mote-render 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mote-render"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Cyril David", "Francesco Rodr\u{ed}guez", "Mayn Kj\u{e6}r"]
  s.date = "2014-08-05"
  s.description = "Mote plugin for Cuba."
  s.email = ["frodsan@me.com", "mayn.kjaer@gmail.com"]
  s.homepage = "https://github.com/frodsan/mote-render"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Mote plugin for Cuba."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mote>, [">= 0"])
      s.add_development_dependency(%q<cuba>, [">= 0"])
      s.add_development_dependency(%q<cutest>, [">= 0"])
    else
      s.add_dependency(%q<mote>, [">= 0"])
      s.add_dependency(%q<cuba>, [">= 0"])
      s.add_dependency(%q<cutest>, [">= 0"])
    end
  else
    s.add_dependency(%q<mote>, [">= 0"])
    s.add_dependency(%q<cuba>, [">= 0"])
    s.add_dependency(%q<cutest>, [">= 0"])
  end
end
