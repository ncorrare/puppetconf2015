require 'spec_helper'
require 'shared_contexts'

describe 'profile::base' do
  # by default the hiera integration uses hiera data from the shared_contexts.rb file
  # but basically to mock hiera you first need to add a key/value pair
  # to the specific context in the spec/shared_contexts.rb file
  # Note: you can only use a single hiera context per describe/context block
  # rspec-puppet does not allow you to swap out hiera data on a per test block
  #include_context :hiera


  # below is the facts hash that gives you the ability to mock
  # facts on a per describe/context block.  If you use a fact in your
  # manifest you should mock the facts below.
  let(:facts) do
    {}
  end
  # below is a list of the resource parameters that you can override.
  # By default all non-required parameters are commented out,
  # while all required parameters will require you to add a value
  let(:params) do
    {
    }
  end
  # add these two lines in a single test block to enable puppet and hiera debug mode
  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)
  it do
    is_expected.to contain_file('/home/ncorrare').
             with({"ensure"=>"directory",
                   "owner"=>"ncorrare",
                   "group"=>"wheel"})
  end
  it do
    is_expected.to contain_group('wheel').
             with({"ensure"=>"present"})
  end
  it do
    is_expected.to contain_user('ncorrare').
             with({"ensure"=>"present",
                   "gid"=>"[wheel]",
                   "managehome"=>"true",
                   "require"=>"Group[wheel]"})
  end
  it do
    is_expected.to contain_file('/etc/issue.net').
             with({"ensure"=>"file",
                   "owner"=>"root",
                   "group"=>"root",
                   "source"=>"puppet:///modules/profile/issue.net"})
  end
  it do
    is_expected.to contain_package('mtr').
             with({"ensure"=>"latest"})
  end
  it do
    is_expected.to contain_service('sshd').
             with({"ensure"=>"running",
                   "enable"=>"true"})
  end
end
