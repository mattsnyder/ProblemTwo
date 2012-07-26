require './lib/problem_two/commands'
require './lib/problem_two/ticket_service'
require './lib/problem_two/locker_room'

module ProblemTwo
  module CommandAdapter
    def to_command
      return Commands::RetrieveBag.new(self) if TicketService.valid?(self)
      return Commands::StoreBag.new(self) if LockerRoom.fits?(self)
      Command.null
    end
  end
end
