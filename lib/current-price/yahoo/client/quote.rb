module CurrentPrice
  module Yahoo
    class Client
      module Quote
        
        def quote(ticker)
          quote_serializer(
            request(
              "http://download.finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=json"
            )
          )
        end

        private

        def quote_serializer(data)
          chunks = data.split(",")
          {
            :low => chunks[0],
            :ticker => chunks[1].gsub(/"/, ''),
            :price => chunks[2].to_f,
            :name => chunks[3].strip.gsub(/"/, '')
          }
        end

      end
    end
  end
end
