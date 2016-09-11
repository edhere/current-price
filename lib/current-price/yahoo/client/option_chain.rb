module CurrentPrice
  module Yahoo
    class Client
      module OptionChain

        def option_chain(ticker)
          url = 'https://query.yahooapis.com/v1/public/yql?q='
          #url += URI.encode("SELECT * FROM yahoo.finance.option_contracts WHERE symbol IN ('#{ticker}') AND expiration='2016-09-16' AND type='C'")
          url += URI.encode("SELECT contract FROM yahoo.finance.option_contract WHERE symbol='#{ticker}'")
          url += '&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
          option_chain_serializer(
            request(
              url
            )
          )
        end

        private

        def option_chain_serializer(data)
          JSON.parse(data)
        end

      end
    end
  end
end
