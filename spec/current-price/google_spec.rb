describe CurrentPrice::Google do
  describe 'Google.client' do

    before(:each) do
      @client = CurrentPrice::Google.client({})
    end

    it 'should handle client' do
      expect(@client.class.to_s).to eq "CurrentPrice::Google::Client"
    end

  end
end
