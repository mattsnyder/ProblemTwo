module ProblemTwo
  module Commands
    class RetrieveBag
      def initialize(ticket_number)
        @ticket_number = ticket_number
      end

      def execute
        ticket = TicketService.retrieve(@ticket_number)
        LockerRoom.retrieve ticket
      end
    end
  end
end
