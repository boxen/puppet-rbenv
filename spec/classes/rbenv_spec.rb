require 'spec_helper'

describe 'rbenv' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('boxen::config')

    should contain_file('/opt/boxen/rbenv').with_ensure('directory')
    should contain_file('/opt/boxen/rbenv/versions').with_ensure('directory')

    should contain_package('ruby-build').with_ensure('latest')
    should contain_package('rbenv').with_ensure('latest')

    should contain_file('/opt/boxen/env.d/rbenv.sh').
      with_source('puppet:///modules/rbenv/rbenv.sh')
  end
end
