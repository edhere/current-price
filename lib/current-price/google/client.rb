module CurrentPrice
  module Google
    class Client < Connection
      Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
      include Google::Client::Quote
      include Google::Client::OptionChain
    end
  end
end
