control 'inspec' do
  describe command('inspec') do
    # This is pretty pointless since inspec wouldn't run if it didn't exist :)
    it { should exist }
  end
end
