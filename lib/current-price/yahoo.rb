module CurrentPrice
  module Yahoo
    def self.client(options={})
      Yahoo::Client.new(options)
    end
  end
end
