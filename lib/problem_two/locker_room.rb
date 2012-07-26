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
      return locker_size_available?(size) > -1
    end

    def self.store(size)
      @@available[locker_size_available?(size)].shift
    end

    def self.retrieve(ticket)
      ticket.invalidate
      true
    end

    def self.locker_size_available?(size)
      @@size_availability_rules[size].each do |availability_index|
        return availability_index if @@available[availability_index].size > 0
      end
      -1
    end
    private_class_method :locker_size_available?

    private_class_method :new
  end
end
