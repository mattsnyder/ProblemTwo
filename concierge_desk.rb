#!/usr/bin/env ruby
require './lib/problem_two'

trap("SIGINT") { exit! }

class ConciergeDesk
  def initialize
    ProblemTwo::LockerRoom.define 1000, 1000, 1000
  end
  def run
    loop do
      print "Enter a ticket number or bag size (small, medium, large):"
      input = gets.chomp
      puts ProblemTwo::Command.parse(input).execute
    end
  end
end

ConciergeDesk.new.run
