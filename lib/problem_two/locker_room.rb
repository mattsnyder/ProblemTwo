require './lib/problem_two/exceptions/invalid_locker_location'

module ProblemTwo
  class LockerRoom
    @@size_availability_rules = {
      "small" => (0..2),
      "medium" => (1..2),
      "large" => [2]
    }

    @@available = [[],[],[]]


    def self.define(small, medium, large)
      @@available = [
                     Array.new(small){|i| "S#{i}"},
                     Array.new(medium){|i| "M#{i}"},
                     Array.new(large){|i| "L#{i}"}
                    ]
    end

    def self.fits?(size)
      return false unless @@size_availability_rules.has_key? size
      return index_of_available_size(size) > -1
    end

    def self.store(size)
      @@available[index_of_available_size(size)].shift
    end

    def self.retrieve(ticket)
      make_locker_available ticket.location
      ticket.invalidate
    rescue Exceptions::InvalidLockerLocation
      false
    end


    def self.make_locker_available(location)
      case location[0]
      when 'S'
        @@available[0] << location
      when 'M'
        @@available[1] << location
      when 'L'
        @@available[2] << location
      else
        raise Exceptions::InvalidLockerLocation.new
      end
    end
    private_class_method :make_locker_available

    def self.index_of_available_size(size)
      @@size_availability_rules[size].each do |availability_index|
        return availability_index if @@available[availability_index].size > 0
      end
      -1
    end
    private_class_method :index_of_available_size

    private_class_method :new
  end
end
