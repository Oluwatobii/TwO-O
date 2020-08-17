class Question
  attr_reader :num_1, :num_2, :answer


  # Creating Question
  def initialize
    @num_1 = 1 + rand(20)
    @num_2 = 1 + rand(20)
    @answer = @num_1 + @num_2
  
  end
end