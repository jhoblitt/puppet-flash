require 'spec_helper_acceptance'

describe 'flash class' do
  describe 'running puppet code' do
    pp = <<-EOS
      if $::osfamily == 'RedHat' {
        class { 'epel': } -> Class['flash']
      }

      include ::flash
    EOS

    it 'applies the manifest twice with no stderr' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('flash-plugin') do
      it { should be_installed }
    end

    describe yumrepo('adobe-linux-x86_64') do
      it { should be_enabled }
    end
  end
end
