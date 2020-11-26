# frozen_string_literal: true

require 'rake/testtask'

Rake.add_rakelib ENV['RAKE_TASKS'] unless ENV['RAKE_TASKS'].nil?

Rake::TestTask.new(:unit_test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = false
  t.test_files = FileList['test/unit/**/*_test.rb']
end

Rake::TestTask.new(:integration_test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = false
  t.test_files = FileList['test/integration/**/*_test.rb']
end

task :rubocop do
  sh 'bundle exec rubocop'
end

task test: %i[unit_test integration_test]
task release: %i[rubocop test]
task default: :release
