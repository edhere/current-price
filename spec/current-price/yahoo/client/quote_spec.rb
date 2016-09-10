describe CurrentPrice::Yahoo::Client::Quote do
  describe 'Yahoo.client.quote()' do

    before(:each) do
      @client = CurrentPrice::Yahoo.client({})
      @quote = @client.quote("CSCO")
    end

  end
end
