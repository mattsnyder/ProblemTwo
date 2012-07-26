require 'rspec/given'

require './lib/problem_two/ticket_service'


describe "managing locker room tickets" do
  describe "when retrieving a ticket" do
    context "with a good ticket number" do
      Given (:ticket) { ProblemTwo::TicketService.create("location1") }
      When (:result) { ProblemTwo::TicketService.retrieve ticket.number }
      Then { result.location.should == "location1" }
      Then { result.provider.should == ProblemTwo::TicketService }
    end

    context "with a bad ticket" do
      When (:result) { ProblemTwo::TicketService.retrieve "badnumber" }
      Then { result.should be_nil }
    end
  end

  describe "when creating tickets" do
    Given (:ticket1) { ProblemTwo::TicketService.create("location1") }
    Given (:ticket2) { ProblemTwo::TicketService.create("location4") }
    Then { ticket1.number.should_not == ticket2.number }
  end

  describe "when creating lots of tickets" do
    Given (:tickets) { [] }
    Given {
      (0..10000).each do |i|
        tickets << ProblemTwo::TicketService.create(i).number
      end
    }
    Then { tickets.uniq.should have(10001).items }
  end

end
