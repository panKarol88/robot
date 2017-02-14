require './lib'

module ToyRobotSimulator
  class Playground
    attr_accessor :simulator

    def initialize
      @simulator = Simulator.new
      play
    end

    def play
      p "Welcome!"
      p "Please, declare what input type do you prefer, [F]ile or [K]eyboard."
      p "Type 'quit' to quit."

      while(true)
        input = STDIN.gets

        if input.upcase == "F\n"
          p "Please provide a .txt file with correct commands and place it in the App direction."
          p "Press ENTER when you ready."

          while(true)
            input = STDIN.gets
            if input == "\n"
              commands = open_commands_from_file
              if commands.nil?
                p "There is something wrong with your .txt file. Please try again or type 'quit' to quit."
                next
              else
                @simulator.process_commands_from_file(commands)
                break
              end
            elsif input.upcase == "QUIT\n"
              break
            end
          end

          break
        elsif input.upcase == "K\n"
          p "This is a good idea to place your robot first."
          p "Use PLACE command to begin limitless fun."
          while(true)
            input = STDIN.gets
            break if input.upcase == "QUIT\n"
            @simulator.process_command(input)
          end

          break
        elsif input.upcase == "QUIT\n"
          break
        else
          p "Well .... let's start over. Please choose input type or type 'quit' to quit."
        end
      end
    end

    def open_commands_from_file
      begin
        file = File.open("commands.txt")
        commands = file.read.split("\n")
      rescue
        return nil
      end
    end

  end

  p = Playground.new
end
