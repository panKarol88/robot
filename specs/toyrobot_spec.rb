require_relative './../lib'

include ToyRobotSimulator

#with board DEFAULT 5x5
describe ToyRobot do
  describe "#creating" do

    it "is valid with valid attributes" do
      expect{ ToyRobot.new }.to_not raise_error
    end

  end

  describe "#methods" do
    let(:robot) { ToyRobot.new }

    it "should acts as it should be" do
      expect{ robot.move }.to_not raise_error
      expect{ robot.left }.to_not raise_error
      expect{ robot.right }.to_not raise_error
      expect(robot.coordinates).to be_nil

      expect{ robot.place(-1, -1, "WEST") }.to_not raise_error
      expect(robot.coordinates).to be_nil

      robot.place(0, 0, "NORTH")
      expect(robot.coordinates.x).to eql 0
      expect(robot.coordinates.y).to eql 0
      expect(robot.coordinates.direction.facing).to eql "NORTH"

      robot.move
      expect(robot.coordinates.x).to eql 0
      expect(robot.coordinates.y).to eql 1
      expect(robot.coordinates.direction.facing).to eql "NORTH"

      robot.left
      expect(robot.coordinates.x).to eql 0
      expect(robot.coordinates.y).to eql 1
      expect(robot.coordinates.direction.facing).to eql "WEST"

      robot.move
      expect(robot.coordinates.x).to eql 0
      expect(robot.coordinates.y).to eql 1
      expect(robot.coordinates.direction.facing).to eql "WEST"

      robot.right
      robot.right
      robot.move
      expect(robot.coordinates.x).to eql 1
      expect(robot.coordinates.y).to eql 1
      expect(robot.coordinates.direction.facing).to eql "EAST"
    end
  end
end
