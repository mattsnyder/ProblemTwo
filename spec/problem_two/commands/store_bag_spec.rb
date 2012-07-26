require 'rspec/given'

require './lib/problem_two/commands/store_bag'

describe "storing a bag in the locker room" do
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
