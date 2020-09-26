# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'compact_log_formatter/version'

Gem::Specification.new do |s|
  s.name          = 'compact_log_formatter'
  s.version       = CompactLogFormatter::VERSION
  s.authors       = ['Mattia Roccoberton']
  s.email         = ['mat@blocknot.es']
  s.homepage      = 'https://github.com/blocknotes/compact_log_formatter'
  s.licenses      = ['MIT']
  s.summary       = 'Compact Log Formatter'
  s.description   = 'A Compact Log Formatter for Rails'

  s.files         = Dir['{app,lib}/**/*', 'LICENSE.md', 'README.md']
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
