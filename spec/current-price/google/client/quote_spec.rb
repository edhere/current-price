describe CurrentPrice::Google::Client::Quote do
  describe 'Google.client.quote()' do

    before(:each) do
      @client = CurrentPrice::Google.client({})
      @quote = @client.quote("CSCO")
    end

    it 'should retrieve cisco quote' do
    end

  end
end
