require 'spec_helper_acceptance'

describe 'vision_skeleton' do
  context 'with defaults' do
    it 'run idempotently' do
      pp = <<-EOS
        class { 'vision_skeleton': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'packages installed' do
    describe package('wget') do
      it { is_expected.to be_installed }
    end
  end
  # Test for Hiera data - can be deleted
  context 'test hiera data' do
    describe file('/root/hello.common') do
      it { is_expected.to exist }
      its(:content) { is_expected.to match 'Hello World' }
    end
    describe file('/root/hello.testing') do
      it { is_expected.to exist }
      its(:content) { is_expected.to match 'Hello Testing' }
    end
  end
end
