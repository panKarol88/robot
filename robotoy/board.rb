module ToyRobotSimulator
  # Singleton
  # Declare dimentions or leave defaults
  class Board
    attr_accessor :dim_x, :dim_y
    DIM_X = 5
    DIM_Y = 5

    def initialize(dim_x=nil, dim_y=nil)
      @dim_x = dim_x || DIM_X
      @dim_y = dim_y || DIM_Y
    end

    @@instance = nil

    def self.instance(dim_x=nil, dim_y=nil)
      @@instance || create_board(dim_x, dim_y)
    end

    private
      def self.create_board(dim_x=nil, dim_y=nil)
        @@instance = Board.new(dim_x, dim_y)
      end

      def self.dimentions_valid?(x, y)
        return true if x.nil? && y.nil?
        (x.is_a? Integer) && (y.is_a? Integer) && x>0 && y>0
      end

      def self.new(*args)
        if @@instance
          @@instance
        elsif args.size == 2
          raise ArgumentError if !dimentions_valid?(args[0], args[1])
          super
        else
          raise ArgumentError
        end
      end
  end
end
