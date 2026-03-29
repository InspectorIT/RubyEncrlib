# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
    t.libs << 'lib'
    t.pattern = 'test/**/test_*'
end

task default: :test
