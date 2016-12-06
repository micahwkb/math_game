module MathGame
  # main gameplay loop
  class Game
    attr_accessor :current_player

    def initialize
      @p1 = Player.new('Player 1')
      @p2 = Player.new('Player 2')
      @current_player = @p1
    end

    def game_over(winner, lives_remaining)
      puts "#{winner.name} wins with a score of #{lives_remaining}/3"
      puts '----- GAME OVER -----'
      puts 'Good bye!'
    end

    def new_turn
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
      puts '----- NEW TURN -----'
      next_question
      puts "#{@current_player.name}: #{@question}"
      print '> '
      @response = $stdin.gets.chomp.to_i
      # puts "the response is #{@response}"
      @response == @answer ? switch_players : lose_life
      # end
    end

    def lose_life
      @current_player.lives -= 1
      if @current_player.lives.zero?
        @current_player == @p1 ? game_over(@p2, @p2.lives) : game_over(@p1, @p1.lives)
      else
        switch_players
      end
    end

    def switch_players
      @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
      new_turn
    end

    def next_question
      problem = Question.new
      @question = problem.new_question
      @answer = problem.answer
    end

    def start
      puts 'Starting game, get ready for some math(s)'
      new_turn
    end
  end
end
