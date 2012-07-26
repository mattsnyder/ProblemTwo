require 'rspec'
require 'rspec/given'

require './lib/problem_two/commands/retrieve_bag'

describe "executing the retrievel of a bag" do
  Given (:command) { ProblemTwo::Commands::RetrieveBag.new "123456789" }


  context "with a good ticket and locker location" do
    Given (:ticket) { mock "ticket", :locker_location => "135M" }
    Given { ProblemTwo::TicketService.stub(:retrieve).and_return ticket }
    Given { ProblemTwo::LockerRoom.stub(:retrieve).and_return true }
    When (:result) { command.execute }
    Then { result.should be_true }
  end

  context "with a bad ticket" do
    Given { ProblemTwo::TicketService.stub(:retrieve).and_return nil }
    Given { ProblemTwo::LockerRoom.stub(:retrieve).with(nil).and_return false }
    When (:result) { command.execute }
    Then { result.should be_false }
  end

  context "with a good ticket and failed retrieval" do
    Given (:ticket) { mock "ticket" }
    Given { ProblemTwo::TicketService.stub(:retrieve).and_return ticket }
    Given { ProblemTwo::LockerRoom.stub(:retrieve).with(ticket).and_return false }
    When (:result) { command.execute }
    Then { result.should be_false }
  end
end
