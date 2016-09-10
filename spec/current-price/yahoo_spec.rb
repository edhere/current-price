describe CurrentPrice::Yahoo do
  describe 'Yahoo.client' do

    before(:each) do
      @client = CurrentPrice::Yahoo.client({})
    end

    it 'should handle client' do
      expect(@client.class.to_s).to eq "CurrentPrice::Yahoo::Client"
    end

  end
end
