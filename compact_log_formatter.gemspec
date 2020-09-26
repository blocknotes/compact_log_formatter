# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'compact_log_formatter/version'

Gem::Specification.new do |s|
  s.name          = 'compact_log_formatter'
  s.version       = CompactLogFormatter::VERSION
  s.authors       = ['Mattia Roccoberton']
  s.email         = ['mat@blocknot.es']
  s.homepage      = 'https://github.com/Mattia Roccoberton/compact_log_formatter'
  s.licenses      = ['MIT']
  s.summary       = '[summary]'
  s.description   = '[description]'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
