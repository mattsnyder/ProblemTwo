require 'rspec/given'

require './lib/problem_two/locker_room'


describe "storing a bag in the locker room" do
  context "with a supported size and room for it" do
    Given { ProblemTwo::LockerRoom.define 10, 10, 10 }
    When (:result) { ProblemTwo::LockerRoom.store("small") }
    Then { result.should == "S0" }
  end

  context "with a locker room already containing bags" do
    Given { ProblemTwo::LockerRoom.define 10, 10, 10 }
    Given { ProblemTwo::LockerRoom.store("small") }
    When (:result) { ProblemTwo::LockerRoom.store("small") }
    Then { result.should == "S1" }
  end

  context "with a locker room already containing bags of other sizes" do
    Given { ProblemTwo::LockerRoom.define 10, 10, 10 }
    Given { ProblemTwo::LockerRoom.store("small") }
    When (:result) { ProblemTwo::LockerRoom.store("medium") }
    Then { result.should == "M0" }
  end

  context "with a bag that only has availability in a larger size" do
    Given { ProblemTwo::LockerRoom.define 0, 10, 10 }
    When (:result) { ProblemTwo::LockerRoom.store("small") }
    Then { result.should == "M0" }
  end

  context "with a bag that does not have room to be stored" do
    Given { ProblemTwo::LockerRoom.define 0, 10, 0 }
    When (:result) { ProblemTwo::LockerRoom.store("large") }
    Then { result.should be_nil }
  end
end

describe "retrieving a bag" do
  context "from a small locker" do
    Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
    Given (:ticket) { ProblemTwo::Ticket.new "12345", "S1", mock("service") }
    Given { ticket.should_receive(:invalidate).and_return true }
    When (:result) { ProblemTwo::LockerRoom.retrieve ticket }
    Then { result.should be_true }
    Then { ProblemTwo::LockerRoom.fits?("small").should be_true }
  end

  context "from a medium locker" do
    Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
    Given (:ticket) { ProblemTwo::Ticket.new "12345", "M5", mock("service") }
    Given { ticket.should_receive(:invalidate).and_return true }
    When (:result) { ProblemTwo::LockerRoom.retrieve ticket }
    Then { result.should be_true }
    Then { ProblemTwo::LockerRoom.fits?("medium").should be_true }
  end

   context "from a large locker" do
    Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
    Given (:ticket) { ProblemTwo::Ticket.new "12345", "L2", mock("service") }
    Given { ticket.should_receive(:invalidate).and_return true }
    When (:result) { ProblemTwo::LockerRoom.retrieve ticket }
    Then { result.should be_true }
    Then { ProblemTwo::LockerRoom.fits?("large").should be_true }
  end

  context "from an invalid locker location" do
    Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
    Given (:ticket) { ProblemTwo::Ticket.new "12345", "X2", mock("service") }
    Given { ticket.should_not_receive(:invalidate) }
    When (:result) { ProblemTwo::LockerRoom.retrieve ticket }
    Then { result.should be_false }
  end
end

describe "checking if a bag fits in the locker room" do

  describe "with an unsupported size" do
    Then { ProblemTwo::LockerRoom.fits?("xlarge").should be_false }
  end

  describe "with a small bag" do
    context "and plenty of small space" do
      Given { ProblemTwo::LockerRoom.define 10, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("small").should be_true }
    end

    context "and no small space, but plenty of medium space" do
      Given { ProblemTwo::LockerRoom.define 0, 10, 0 }
      Then { ProblemTwo::LockerRoom.fits?("small").should be_true }
    end

    context "and no small or medium space, but plenty of large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 10 }
      Then { ProblemTwo::LockerRoom.fits?("small").should be_true }
    end

    context "and no small, medium or large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("small").should be_false }
    end
  end

  describe "with a medium bag" do
    context "and plenty of small space" do
      Given { ProblemTwo::LockerRoom.define 10, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("medium").should be_false }
    end

    context "and no small space, but plenty of medium space" do
      Given { ProblemTwo::LockerRoom.define 0, 10, 0 }
      Then { ProblemTwo::LockerRoom.fits?("medium").should be_true }
    end

    context "and no small or medium space, but plenty of large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 10 }
      Then { ProblemTwo::LockerRoom.fits?("medium").should be_true }
    end

    context "and no small, medium or large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("medium").should be_false }
    end
  end

  describe "with a large bag" do
    context "and plenty of small space" do
      Given { ProblemTwo::LockerRoom.define 10, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("large").should be_false }
    end

    context "and no small space, but plenty of medium space" do
      Given { ProblemTwo::LockerRoom.define 0, 10, 0 }
      Then { ProblemTwo::LockerRoom.fits?("large").should be_false }
    end

    context "and no small or medium space, but plenty of large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 10 }
      Then { ProblemTwo::LockerRoom.fits?("large").should be_true }
    end

    context "and no small, medium or large space" do
      Given { ProblemTwo::LockerRoom.define 0, 0, 0 }
      Then { ProblemTwo::LockerRoom.fits?("large").should be_false }
    end
  end
end

