# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-careers'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Careers forms-extension for Refinery CMS'
  s.date              = '2014-01-29'
  s.summary           = 'Careers forms-extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.1.1'
  s.add_dependency    'refinerycms-settings', '~> 2.1.1'
end
