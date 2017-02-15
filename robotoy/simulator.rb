module ToyRobotSimulator
  class Simulator
    attr_accessor :robot

    def initialize
      @robot = ToyRobot.new
    end

    def process_command command
      command_splitted = command.split
      if command_splitted.size == 1
        @robot.send(command_splitted.first.downcase)
      elsif command_splitted.size == 2 && command_splitted.first.upcase == "PLACE"
        attrs = command_splitted.last.split(',')
        @robot.send(command_splitted.first.downcase,
                      attrs[0].to_i, attrs[1].to_i, attrs[2])
      else
        raise "bad request"
      end

      rescue
        p "There is something wrong with your command"
    end

    def process_commands_from_file commands
      commands.each do |command|
        process_command(command)
      end
    end

  end
end
