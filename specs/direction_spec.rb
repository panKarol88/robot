require_relative './../lib'

include ToyRobotSimulator

describe Direction do
  describe "#creating" do
    it "is valid with valid attributes" do
      expect(Direction.new("NORTH")).to_not be_nil
      expect(Direction.new("north")).to_not be_nil
      expect(Direction.new("WEST")).to_not be_nil
      expect(Direction.new("west")).to_not be_nil
      expect(Direction.new("SOUTH")).to_not be_nil
      expect(Direction.new("south")).to_not be_nil
      expect(Direction.new("EAST")).to_not be_nil
      expect(Direction.new("east")).to_not be_nil
    end

    it "is getting error with wrong number of arguments" do
      expect{ Direction.new }.to raise_error(ArgumentError)
      expect{ Direction.new("north", "east") }.to raise_error(ArgumentError)
    end

    it "is nil with invalid attributes" do
      expect(Direction.new("BACKWARDS")).to be_nil
      expect(Direction.new("")).to be_nil
      expect(Direction.new(" ")).to be_nil
      expect(Direction.new(1)).to be_nil
    end
  end

  describe "#methods" do
    let(:direction) { Direction.new("NORTH") }

    it "should acts as it should be" do
      expect(direction.facing).to eql "NORTH"
      direction.rotate!("LEFT")
      expect(direction.facing).to eql "WEST"
      direction.rotate!("RIGHT")
      expect(direction.facing).to eql "NORTH"
      direction.rotate!("RIGHT")
      direction.rotate!("RIGHT")
      direction.rotate!("RIGHT")
      expect(direction.facing).to eql "WEST"
    end
  end
end
