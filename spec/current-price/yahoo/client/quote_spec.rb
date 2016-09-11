describe CurrentPrice::Yahoo::Client::Quote do
  describe 'Yahoo.client.quote()' do

    before(:each) do
      @client = CurrentPrice::Yahoo.client({})
      @quote = @client.quote("CSCO")
    end

    it 'should retrieve cisco quote' do
    end

  end
end
