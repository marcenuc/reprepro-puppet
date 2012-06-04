require 'spec_helper'

describe 'reprepro' do
  it { should contain_package('reprepro').with_ensure('latest') }

  context 'without root parameter' do
    it { should contain_file('/srv/reprepro').with(
      'ensure'  => 'directory'
    ) }
  end

  context 'with root => "/var/www"' do
    let(:params) { {:root => '/var/www'} }

    it { should contain_file('/var/www').with(
      'ensure'  => 'directory'
    ) }
  end
end
