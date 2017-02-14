require 'byebug'

module ToyRobotSimulator
  class Coordinates
    ATTRS = [:x, :y, :direction]
    attr_accessor(*ATTRS)

    def initialize x, y, direction
      @x, @y = x, y if dimensions_valid?(x, y)
      @direction = ToyRobotSimulator::Direction.new(direction)
    end

    def move!
      x = @x
      y = @y

      case @direction.facing
      when 'NORTH'
        y += 1
      when 'SOUTH'
        y -= 1
      when 'EAST'
        x += 1
      when 'WEST'
        x-= 1
      end

      process_new_position_request_to!(x, y)
    end

    def is_valid?
      ATTRS.each do |attr|
        return false if self.send(attr).nil?
      end
      true
    end

    private

      def dimensions_valid?(x, y)
        return false if (!x.is_a? Integer) || (!y.is_a? Integer)

        board = ToyRobotSimulator::Board.instance
        # the only threat are the edges right now
        (0...board.dim_x).include?(x) && (0...board.dim_y).include?(y)
      end

      def process_new_position_request_to!(x, y)
        if dimensions_valid? x, y
          @x, @y = x, y
        else
          handleTheCollision
        end
      end

      def handleTheCollision
        # just ignore it
      end

  end
end
