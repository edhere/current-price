module CurrentPrice
  module Yahoo
    class Client < Connection
      Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
      include Yahoo::Client::Quote
      include Yahoo::Client::OptionChain
    end
  end
end
