require 'rspec'
require 'rspec/given'

require './lib/problem_two/command'

describe "executing commands" do
  describe "with information from the user" do
    Given (:command) { mock "actual command" }
    Given (:input) { mock "string value" }
    Given { input.should_receive(:extend).with(ProblemTwo::CommandAdapter) }
    Given { input.stub(:to_command).and_return command }
    Then { ProblemTwo::Command.parse(input).should == command }
  end
end
