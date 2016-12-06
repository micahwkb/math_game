module MathGame
  # Question-generating methods
  class Question
    attr_reader :number1, :number2

    def initialize
      @number1 = random_number
      @number2 = random_number
    end

    def answer
      @number1 + @number2
    end

    def random_number
      1 + rand(10)
    end

    def new_question
      "What does #{@number1} + #{@number2} equal?"
    end
  end
end
