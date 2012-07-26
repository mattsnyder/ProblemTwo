require 'rspec'
require 'rspec/given'

require './lib/problem_two/command_adapter'

describe "converting strings to commands" do
  Given (:string) { "".extend ProblemTwo::CommandAdapter }

  context "without a ticket number or bag size" do
    When (:command) { string.to_command }
    Then { command.should == ProblemTwo::Command.null }
  end

  context "with a ticket number" do
    Given { ProblemTwo::TicketService.stub(:valid?).with(string).and_return true }
    Given (:retrieve_command) { mock "retrieve bag command" }
    Given { ProblemTwo::Commands::RetrieveBag.should_receive(:new).with(string).and_return retrieve_command }
    When (:command) { string.to_command }
    Then { command.should == retrieve_command }
  end

  context "with a bag size" do
    Given { ProblemTwo::LockerRoom.stub(:fits?).with(string).and_return true }
    Given (:store_command) { mock "store bag command" }
    Given { ProblemTwo::Commands::StoreBag.should_receive(:new).with(string).and_return store_command }
    When (:command) { string.to_command }
    Then { command.should == store_command }
  end
end
