require "bundler/gem_tasks"
require "minitest/test_task"
task default: "test"
Rake::TestTask.new do |task|
    task.pattern = 'test/test_caesar_cipher.rb'
    task.pattern = 'test/test_caesar_decipher.rb'
    task.pattern = 'test/test_playfair_cipher.rb'
    task.pattern = 'test/test_viginere_cipher.rb'
    task.pattern = 'test/test_viginere_decipher.rb'
    task.pattern = 'test/test_playfair_decipher.rb'
end
