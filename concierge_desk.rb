#!/usr/bin/env ruby
require './lib/problem_two'

trap("SIGINT") { exit! }

class ConciergeDesk
  def initialize
    LockerRoom.define 1000, 1000, 1000
  end
  def run
    loop do
      print "Enter a ticket number, bag size, or type ? to see bag sizes:"
      input = gets.chomp
      print ProblemTwo::Command.parse(input).execute
    end
  end
end

ConciergeDesk.new.run
