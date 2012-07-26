module ProblemTwo
  class LockerRoom
    @@size_availability_rules = {
      "small" => (0..2),
      "medium" => (1..2),
      "large" => [2]
    }

    @@available = [0,0,0]

    def self.define(small, medium, large)
      @@available = [small, medium, large]
    end

    def self.fits?(size)
      return false unless @@size_availability_rules.has_key? size
      @@size_availability_rules[size].each do |availability_index|
        fits = @@available[availability_index] > 0
        return true if fits
      end
      false
    end

    def self.retrieve(location)
    end

    private_class_method :new
  end
end
