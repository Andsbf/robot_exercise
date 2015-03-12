require_relative 'custom_exception_classes'

class Robot

  attr_accessor :equipped_weapon
  attr_reader :items, :health

  def initialize
    @position = {horizontal:0, vertical:0}
    @items = [] 
    @health = 100
    @equipped_weapon = nil
  end

  def position
    @position.values
  end

  def move_left
    @position[:horizontal] -= 1 
    @position.values
  end

  def move_right
    @position[:horizontal] += 1   
    @position.values
  end

  def move_up
    @position[:vertical] += 1
  end

  def move_down
    @position[:vertical] -= 1
  end

  def pick_up(obj)  
    if( (items_weight + obj.weight) <= 250)
      @equipped_weapon = obj if obj.kind_of? Weapon
      items << obj
    else
      false
    end
  end

  def items_weight
    @items.inject(0){|sum, item| sum + item.weight}

  end

  def wound(value)
    @health -= value 
    @health = 0 if @health < 0
  end

  def heal(value)
    @health += value
    @health = 100 if @health > 100
  end

  def attack!(enemy)
    raise  EnemyHasToBeRobotError, "enemy has to be a robot" unless (enemy.kind_of? Robot)
    if equipped_weapon == nil
      enemy.wound(5)
    else
      self.equipped_weapon.hit(enemy)
    end
  end

  def heal!
    raise RobotAlreadyDeadError, "Robot is alread dead" if @health <= 0
    @health += value
    @health = 100 if @health > 100
  end



end
