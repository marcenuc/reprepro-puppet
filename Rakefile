require 'rake'
require 'rubygems'
require 'rspec/core/rake_task'
require 'json'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Run smoke tests"
task :test do
  print `puppet apply --noop --modulepath=spec/fixtures/modules tests/init.pp`
end

desc "Build package"
task :build do
  root = 'pkg'
  print `rm -r '#{root}'` if File.directory?(root)
  print `puppet module build '#{root}'`
  # "puppet module build" puts any garbage in the package
  # let's build it by ourselves
  metadata = JSON.parse(IO.read(Dir["#{root}/*/metadata.json"][0]))
  name = [metadata['name'], metadata['version']].join('-')
  files = metadata['checksums'].keys.map {|f| "#{name}/#{f}" }
  print `tar -C '#{root}' -zcf '#{root}/#{name}.tar.gz' '#{name}/metadata.json' '#{files.join("' '")}'`
end
