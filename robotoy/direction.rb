module ToyRobotSimulator
  class Direction
    attr_accessor :facing, :directions_available
    #in the clockwise order
    DIRECTIONS_AVAILABLE = %w(NORTH EAST SOUTH WEST).freeze

    def initialize facing
      @facing = facing
    end

    def rotate! direction
      dirs = DIRECTIONS_AVAILABLE
      dir_index = dirs.find_index(@facing)

      case direction.upcase
      when 'LEFT'
        dir_index -= 1
      when 'RIGHT'
        dir_index +=1
        dir_index = 0 if dir_index >= dirs.size
      end

      @facing = dirs[dir_index]
    end

    private
      def self.new facing
        facing_valid?(facing&.to_s.upcase! || facing) ? super : nil
      end

      def self.facing_valid? facing
        facing.is_a?(String) && DIRECTIONS_AVAILABLE.include?(facing)
      end

  end
end
