module ToyRobotSimulator
  class ToyRobot
    attr_accessor :coordinates

    def place (x, y, direction)
      coord = Coordinates.new(x, y, direction)
      @coordinates = coord if coord.is_valid?
    end

    def move
      @coordinates&.move!
    end

    def left
      @coordinates&.direction&.rotate!('LEFT')
    end

    def right
      @coordinates&.direction&.rotate!('RIGHT')
    end

    def report
      coord = @coordinates
      if coord.nil?
        puts "Robot is not on the table"
      else
        puts "#{coord.x},#{coord.y},#{coord&.direction&.facing}"
      end
    end
  end
end
