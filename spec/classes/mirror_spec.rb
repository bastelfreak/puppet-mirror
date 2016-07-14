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
        it { should contain_class('mirror::params') }
        it { should contain_class('mirror::user') }
        it { should contain_class('mirror::files') }
        it { should contain_class('mirror::systemd') }
        it { should contain_file('/home/mirror/scripts/mirror_all').with_ensure('link') }
        it { should contain_file('/home/mirror/scripts/mirror_distributions').with_ensure('link') }
        it { should contain_file('/home/mirror/scripts/mirror_everything_else').with_ensure('link') }
        it { should contain_file('mirror@.service') }
        it { should contain_file('mirror@.timer') }
        it { should contain_user('mirror') }
        it { should contain_group('mirror') }
        it { should contain_service('mirror@mirror_all.service') }
        it { should contain_service('mirror@mirror_all.timer') }
        it { should contain_service('mirror@mirror_distributions.service') }
        it { should contain_service('mirror@mirror_distributions.timer') }
        it { should contain_service('mirror@mirror_everything_else.service') }
        it { should contain_service('mirror@mirror_everything_else.timer') }
        sync_sripts = [
          'sync-archlinux.sh',
          'sync-autoinstall.plesk.com.sh',
          'sync-centos.sh',
          'sync-cpan.sh',
          'sync-cygwin.sh',
          'sync-debian.sh',
          'sync-dell.sh',
          'sync-elrepo.sh',
          'sync-epel.sh',
          'sync-fedora.sh',
          'sync-foreman.sh',
          'sync-freebsd.sh',
          'sync-gentoo.sh',
          'sync-hpe.sh',
          'sync-jenkins.sh',
          'sync-openbsd.sh',
          'sync-postgresql.sh',
          'sync-puppet.sh',
          'sync-repoforge.sh',
          'sync.sh',
          'sync-ubuntu.sh',
        ]
        sync_sripts.each do |script|
          it do
            should contain_file(script).with(
              'ensure'  => 'file',
              'owner'   => 'mirror',
              'group'   => 'mirror',
              'mode'    => '0755'
            )
          end
        end
      end
    end
  end
end
