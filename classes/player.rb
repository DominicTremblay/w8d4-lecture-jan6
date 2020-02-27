class Player

  # defines getters and setters
  # READ
  attr_reader :name, :ap
  # WRITE
  
  # both READ AND WRITE
  # attr_writer :hp
  attr_accessor :hp

# constructor
  def initialize(name)
    @name = name
    @hp = 20
    @ap = 10
  end


  def dead?
    @hp <= 0
  end

  def attacks(enemy)
    puts "#{@name} is attacking #{enemy.name}"
    damage = rand(@ap) + 1
    enemy.takes_damage(damage)
  end

  def takes_damage(points)
    "#{@name} is taking #{points} points of damage"
    @hp -= points
  end

  # getter
  # def name
  #   @name
  # end

  # def hp
  #   @hp
  # end

  # # setter
  # def hp=(points)
  #   @hp = points
  # end

  # def ap
  #   @ap
  # end

end