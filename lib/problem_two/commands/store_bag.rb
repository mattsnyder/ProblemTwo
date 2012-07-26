require './lib/problem_two/locker_room'
require './lib/problem_two/ticket_service'

module ProblemTwo
  module Commands
    class StoreBag
      def initialize(size)
        @size = size
      end

      def execute
        location = LockerRoom.store @size
        return {
          "LOCKER LOCATION" => location,
          "TICKET" => TicketService.create(location)
        }
      end
    end
  end
end
