require 'rspec/given'

require './lib/problem_two/commands/store_bag'


describe "storing a bag" do
  Given (:ticket) { mock "ticket for my locker" }
  Given { ProblemTwo::LockerRoom.should_receive(:store).with("asize").and_return("alocation")  }
  Given { ProblemTwo::TicketService.should_receive(:create).with("alocation").and_return ticket }
  When (:result) { ProblemTwo::Commands::StoreBag.new("asize").execute }
  Then { result.should == {"LOCKER LOCATION" => "alocation", "TICKET" => ticket} }
end
