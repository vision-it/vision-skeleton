require 'spec_helper'
require 'hiera'

describe 'vision_skeleton' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      # Default check to see if manifest compiles
      context 'compile' do
        it { is_expected.to compile.with_all_deps }
      end
      # Test for Hiera data - can be deleted
      context 'test hiera data' do
        it { is_expected.to contain_file('Hello World') }
        it { is_expected.to contain_file('Hello Testing') }
      end
    end
  end
end
