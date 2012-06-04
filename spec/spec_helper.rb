require 'rspec-puppet'

RSpec.configure do |c|
  fixture_path = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures')
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
end
