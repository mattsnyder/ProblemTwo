module ProblemTwo
  class Ticket
    attr_accessor :number, :location, :provider

    def initialize(number, location, provider)
      @number = number
      @location = location
      @provider = provider
    end
  end
end
