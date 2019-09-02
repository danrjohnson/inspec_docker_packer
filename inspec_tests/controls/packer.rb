control 'packer' do
  describe file('/opt/packer/packer') do
    it { should be_file }
    it { should be_executable }
  end
end
