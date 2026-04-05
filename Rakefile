# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*'
end

RuboCop::RakeTask.new(:rubocop)

task default: %i[test rubocop]
