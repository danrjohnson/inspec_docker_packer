control 'packer' do
  describe file('/usr/bin/packer') do
    it { should be_file }
    it { should be_executable }
  end
end
