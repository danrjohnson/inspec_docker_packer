control 'nginx' do
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_running }
    it { should be_enabled }
  end

  describe http('http://localhost/') do
    its('status') { should cmp 200 }
  end
end
