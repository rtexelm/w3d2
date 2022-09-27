require_relative "./board.rb"
require_relative "./card.rb"


class Game

    attr_reader :board

    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def set_cards
        board.create_deck
        board.populate
    end

    def make_guess(pos)
        board.reveal(pos)

        @previous_guess = pos
        board.print(board.hidden_board)

        puts "Enter second coordinates like 'X Y'"
        guessed_pos = gets.chomp.split.map(&:to_i)
        board.reveal(guessed_pos)
        board.print(board.hidden_board)

        sleep(2)
        system("clear")

        if board[@previous_guess].face_value !=  board[guessed_pos].face_value
            board[@previous_guess].hide
            board[guessed_pos].hide
        end
    end

    def play
        self.set_cards
        until board.won?
            board.print(board.hidden_board)

            puts "Enter coordinates like 'X Y'"
            pos = gets.chomp.split.map(&:to_i)
            self.make_guess(pos)
        end

        puts "You Win!"
    end

end

game = Game.new
game.play

