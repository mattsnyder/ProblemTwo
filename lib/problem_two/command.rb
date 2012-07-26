require './lib/problem_two/command_adapter'

module ProblemTwo
  class Command
    def self.parse(string)
      string.extend CommandAdapter
      string.to_command
    end

    def self.null
      @@null ||= NullCommand.new
      @@null
    end

    class NullCommand
    end
  end
end
