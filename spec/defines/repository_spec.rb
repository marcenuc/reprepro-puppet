require 'spec_helper'

describe 'reprepro::repository' do
  let(:title) { 'marcenuc' }

  it { should include_class('reprepro') }

  it { should contain_file('/srv/reprepro/marcenuc').with(
    'ensure'  => 'directory',
    'owner'   => 'marcenuc',
    'group'   => 'marcenuc',
    'require' => 'File[/srv/reprepro]'
  ) }

  it { should contain_file('/srv/reprepro/marcenuc/conf').with(
    'ensure'  => 'directory',
    'owner'   => 'marcenuc',
    'group'   => 'marcenuc',
    'require' => 'File[/srv/reprepro/marcenuc]'
  ) }

  it { should contain_file('/srv/reprepro/marcenuc/conf/distributions').with(
    'ensure'  => 'file',
    'owner'   => 'marcenuc',
    'group'   => 'marcenuc',
    'require' => 'File[/srv/reprepro/marcenuc/conf]',
    'content' => /\A(Origin: [\w\s]+\nLabel: [\w\s]+\nCodename: \w+\nArchitectures: [\w\s]+\nComponents: main\nDescription: [^\n]+\n\n)+/
  ) }

  it { should contain_file('/srv/reprepro/marcenuc/conf/options').with(
    'ensure'  => 'file',
    'owner'   => 'marcenuc',
    'group'   => 'marcenuc',
    'require' => 'File[/srv/reprepro/marcenuc/conf]',
    'content' => %w{verbose ask-passphrase basedir\ .}.join("\n") + "\n"
  ) }

end
