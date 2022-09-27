require "byebug"
require_relative './card.rb'

class Board
    attr_reader :size, :grid, :deck
    def initialize
        @size = 4
        @grid = Array.new(@size) {Array.new(@size, "_")}
        # debugger
        @deck = []
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def create_deck
        num_card_pairs = @size * @size / 2
        values = (:A..:Z).to_a.shuffle

        until @deck.length == num_card_pairs
            face_value = values.pop
            2.times do 
                @deck << Card.new(face_value)
            end
        end
        
        # @deck
    end

    def populate
        deck.each do |card|

            while @grid.flatten.count(card) < 2
                pos = [rand(0...@grid.length), rand(0...@grid.length)]
                self[pos] = card if self[pos] == "_"
            end
            
        end
    end

    def hidden_board
        @grid.map do |row|
            row.map do |instance|
                if instance.revealed
                    instance.face_value
                else
                    "_"
                end
            end
        end
    end

    def print(board)
        board.each do |row| 
            puts row.join(" ")
        end
    end

end

board = Board.new
# p board.populate(:X)
p board.print(board.grid)
p board.create_deck
p board.populate
p board.print(board.grid)
p board[[0, 0]].reveal
p board.print(board.hidden_board)
# p board.size
