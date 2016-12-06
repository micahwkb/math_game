module MathGame
  # Main gameplay loop
  class Game
    attr_accessor :current_player

    def initialize
      @p1 = Player.new('Player 1')
      @p2 = Player.new('Player 2')
      @responses = [
        'So very wrong',
        'Who taught you math?!',
        'Not even close',
        'Better luck next time',
        'Frankly, I feel sorry for you'
      ]
      @current_player = @p1
    end

    def next_question
      problem = Question.new
      @question = problem.new_question
      @answer = problem.answer
    end

    def new_turn
      next_question
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
      puts '----- NEW TURN -----'
      puts "#{@current_player.name}: #{@question}"
      print '> '
      @response = gets.chomp.to_i
      @response == @answer ? switch_players : lose_life
    end

    def switch_players
      @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
      new_turn
    end

    def lose_life
      puts "#{@current_player.name}: #{@responses.sample}"
      @current_player.lives -= 1
      if @current_player.lives.zero?
        @current_player == @p1 ? game_over(@p2, @p2.lives) : game_over(@p1, @p1.lives)
      else
        switch_players
      end
    end

    def game_over(winner, lives_remaining)
      puts "#{winner.name} wins with a score of #{lives_remaining}/3"
      puts '----- GAME OVER -----'
      puts 'Good bye!'
    end

    def start
      puts 'Starting game, get ready for some math(s)'
      new_turn
    end
  end
end
