module CurrentPrice
  module Yahoo
    class Client
      module Quote

        def quote(ticker)
          url = 'https://query.yahooapis.com/v1/public/yql?q='
          url += URI.encode("SELECT * FROM yahoo.finance.quotes WHERE symbol IN ('#{ticker}')")
          url += '&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
          quote_serializer(
            request(
              url
            )
          )
        end

        private

        def quote_serializer(data)
          Hash[
            JSON.parse(data).fetch('query')['results']['quote'].map{ |key, val|
              [underscore(key).to_sym, val]
            }
          ]
        end

      end
    end
  end
end
