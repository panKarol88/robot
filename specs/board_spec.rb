require_relative './../lib'

include ToyRobotSimulator

describe Board do
  describe "#creating" do
    before(:each) do
      @board_class = Board.clone
    end

    it "is getting error with negative " do
      expect{ Board.new(-1, -1)}.to raise_error(ArgumentError)
    end

    it "is getting error with no attributes" do
      expect{ @board_class.new }.to raise_error(ArgumentError)
    end

    it "is getting error with to many attributes" do
      expect{ Board.new(1, 2, 3)}.to raise_error(ArgumentError)
    end

    it "is valid" do
      expect(@board_class.instance).to be_a_kind_of Board
    end

    it "is valid with valid attributes" do
      expect{ @board_class.instance(6, 6) }.to_not raise_error
      expect(Board.instance.dim_x).to eql 5
      expect(Board.instance.dim_y).to eql 5
    end

  end
end
