require './lib/problem_two/ticket'

module ProblemTwo
  class TicketService
    @@tickets = {}

    def self.valid?(number)
      @@tickets.has_key?(number)
    end

    def self.delete(ticket)
      @@tickets.delete ticket.number
    end

    def self.create(locker_location)
      number = generate_number locker_location
      @@tickets[number] = locker_location
      Ticket.new number, locker_location, self
    end

    def self.retrieve(ticket_number)
      location = @@tickets[ticket_number]
      return nil if location.nil?
      Ticket.new ticket_number, location, self
    end

    def self.generate_number(location)
      o =  [('a'..'z'),(0..9)].map{|i| i.to_a}.flatten;
      "#{(0..10).map{ o[rand(o.length)]  }.join}#{location.hash}"
    end
    private_class_method :generate_number

    private_class_method :new
  end
end
