# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'RubyEncrlib'
  s.version     = '0.1.0'
  s.summary     = 'string encryption gem'
  s.description = 'Simple gem with some simple methods to encrypt a message in russian or english'
  s.authors     = ['RusiSLin']
  s.email       = 'RusiSLin@gmail.com'
  s.files       = %w[lib/encrlib.rb lib/caesar.rb lib/playfair.rb lib/viginere.rb]
  s.homepage    = 'https://github.com/fect1/RubyEncrlib'
  s.license     = 'MIT'
  s.metadata['rubygems_mfa_required'] = 'true'
  s.required_ruby_version = '>= 4.0.1'
end
