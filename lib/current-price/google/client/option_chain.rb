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
          Hash[
            eval(data.to_s).fetch(:expirations).map{ |expiry|
              month, day, year = expiry[:m], expiry[:d], expiry[:y]
              ["#{month}-#{day}-#{year}", option_chain_detail_serializer(
                request(
                  "http://www.google.com/finance/option_chain?q=#{ticker}&expd=#{day}&expm=#{month}&expy=#{year}&output=json"
                )
              )]
            }
          ]
        end

        def option_chain_detail_serializer(data)
          data_hash = eval(data.to_s)
          {
            :puts => contracts_serialzer( data_hash.fetch(:puts) ),
            :calls => contracts_serialzer( data_hash.fetch(:calls) )
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
