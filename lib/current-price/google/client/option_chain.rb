module CurrentPrice
  module Google
    class Client
      module OptionChain

        def option_chain(ticker)
          option_chain_serializer(
            ticker,
            request(
              "http://www.google.com/finance/option_chain?q=#{ticker}&output=json"
            )
          )
        end

        private

        def option_chain_serializer(ticker, data)
          chunks = eval(data.to_s)
          Hash[chunks[:expirations].map {|expiration_event|
            month, day, year = expiration_event[:m], expiration_event[:d], expiration_event[:y]
            ["#{month}-#{day}-#{year}", option_chain_detail_serializer(
              request(
                "http://www.google.com/finance/option_chain?q=#{ticker}&expd=#{day}&expm=#{month}&expy=#{year}&output=json"
              )
            )]
          }]
        end

        def option_chain_detail_serializer(data)
          chunks = eval(data.to_s)
          {
            :puts => contracts_serialzer( chunks[:puts] ),
            :calls => contracts_serialzer( chunks[:calls] )
          }
        end

        def contracts_serialzer(contracts)
          contracts.map{|contract|
            {
              :price => contract[:p],
              :bid => contract[:b],
              :ask => contract[:a],
              :close => contract[:c],
              :oi => contract[:oi],
              :volume => contract[:vol],
              :strike => contract[:strike],
            }
          }
        end

      end
    end
  end
end
