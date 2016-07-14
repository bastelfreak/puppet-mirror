require 'spec_helper'

describe 'mirror', type: :class do
  on_supported_os.each do |os, facts|
    context "on supported OS #{os} " do
      let :facts do
        facts
      end

      describe 'with all defaults' do
        it { should compile.with_all_deps }
        it { should contain_class('mirror') }
        it { should contain_file('sync-scripts').with_ensure('directory') }
        it { should contain_file('/home/mirror/scripts/mirror_all').with_ensure('link') }
        it { should contain_file('/home/mirror/scripts/mirror_distributions').with_ensure('link') }
        it { should contain_file('/home/mirror/scripts/mirror_everything_else').with_ensure('link') }
        it { should contain_user('mirror') }
        it { should contain_group('mirror') }
      end
    end
  end
end
