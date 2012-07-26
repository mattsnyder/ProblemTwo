module ProblemTwo
  class Ticket
    attr_accessor :number, :location, :provider

    def initialize(number, location, provider)
      @number = number
      @location = location
      @provider = provider
    end

    def invalidate
      provider.delete(self)
    end

    def to_s
      "LOCKER TICKET NUMBER: #{@number}"
    end
  end
end
