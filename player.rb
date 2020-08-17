class Player
  attr_reader :name
  attr_accessor :hp

  def initialize(name)
    # An instance variable. Meaning each object comes with this
    @name = name
    @hp = 3
  end

  # Check if player is dead
  def dead?
    @hp <= 0
  end

  # Deduct life point if player gave a wrong answer
  def life_loss
    puts "#{@name} lost a life!"
  
    # its life is substracted
    @hp -= 1

  end


end