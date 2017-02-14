require_relative './../lib'

include ToyRobotSimulator

#with board DEFAULT 5x5
describe Coordinates do
  describe "#creating" do

    it "is valid with valid attributes" do
      expect(Coordinates.new(0, 0, "NORTH").is_valid?).to be_truthy
      expect(Coordinates.new(4, 4, "SOUTH").is_valid?).to be_truthy
    end

    it "is getting error with wrong number of arguments" do
      expect{ Coordinates.new }.to raise_error(ArgumentError)
      expect{ Coordinates.new("north", "east") }.to raise_error(ArgumentError)
    end

    it "is nil with invalid attributes" do
      expect(Coordinates.new(-1, 0, "NORTH").x).to be_nil
      expect(Coordinates.new(0, -1, "NORTH").y).to be_nil
      expect(Coordinates.new(0, -1, "NORTH").x).to be_nil
      expect(Coordinates.new(0, -1, "NORTH").y).to be_nil
      expect(Coordinates.new(0, 0, "NOWHERE").direction).to be_nil
      expect(Coordinates.new(0, 0, "NOWHERE").x).to_not be_nil
      expect(Coordinates.new(0, 0, "NOWHERE").y).to_not be_nil
    end
  end

  describe "#methods" do
    let(:coordinates) { Coordinates.new(0,0,"NORTH") }

    it "should acts as it should be" do
      expect(coordinates.x).to eql 0
      coordinates.move!
      expect(coordinates.x).to eql 0
      expect(coordinates.y).to eql 1
      coordinates.direction.facing = "SOUTH"
      coordinates.move!
      expect(coordinates.x).to eql 0
      expect(coordinates.y).to eql 0
      coordinates.move!
      expect(coordinates.x).to eql 0
      expect(coordinates.y).to eql 0
      coordinates.direction.facing = "EAST"
      coordinates.move!
      expect(coordinates.x).to eql 1
      expect(coordinates.y).to eql 0
    end
  end
end
