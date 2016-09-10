require 'httparty'

module CurrentPrice
  class Connection < Utils
    include HTTParty

    def initialize(options={})
      @options = options
    end

    def request(url)
      begin
        self.class.get(url).response.body
      rescue
      end
    end

  end
end
