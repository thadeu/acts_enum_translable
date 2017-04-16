$:.push File.expand_path('../lib', __FILE__)
# Maintain your gem's version:
require 'acts_enum_translable/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'acts_enum_translable'
  s.version     = ActsEnumTranslable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Thadeu Esteves Jr']
  s.email       = ['tadeuu@gmail.com']
  s.homepage    = 'http://github.com/thadeu/acts_enum_translable'
  s.summary     = 'ActiveRecord::Enum Translate with i18n'
  s.description = 'ActsEnumTranslable convention translate enums with .yml file. '
  s.license     = 'MIT'
  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  rails_versions = ['>= 4']
  s.add_dependency 'rails', rails_versions
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'sqlite3'
end
