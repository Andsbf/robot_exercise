require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new

    
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#heal!" do
    it "return raised flag if robot already deade" do
      @robot.wound(999)
      
      expect{@robot.heal!}.to raise_error(RobotAlreadyDeadError)
    end
  end

  describe "#attack!" do
    
    it "raise error when enemy is not a robot" do
      book = double("Book")
      expect{@robot.attack!(book)}.to raise_error(EnemyHasToBeRobotError)
    end

    it "Do not raise error when enemy is  a robot" do
      robot2 = Robot.new
      expect{@robot.attack!(robot2)}.to_not raise_error
    end

    it "damages another robot" do
      robot2 = Robot.new
      @robot.attack!(robot2)
      expect(robot2.health).to eq(95)
    end


  end
class RobotAlreadyDeadError < StandardError
end

class EnemyHasToBeRobotError < StandardError
end





end
