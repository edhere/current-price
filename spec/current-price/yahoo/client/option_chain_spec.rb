describe CurrentPrice::Yahoo::Client::OptionChain do
  describe 'Yahoo.client.option_chain()' do

    before(:each) do
      @client = CurrentPrice::Yahoo.client({})
      @option_chain = @client.option_chain("CSCO")
    end

    it 'should retrieve cisco option chain' do
    end

  end
end
