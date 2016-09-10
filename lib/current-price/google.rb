module CurrentPrice
  module Google
    def self.client(options={})
      Google::Client.new(options)
    end
  end
end
