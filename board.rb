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
            @deck << Card.new(values.pop)
        end
        
        # @deck
    end


    def populate

        deck.each do |card|

            while @grid.flatten.count(card.face_value) < 2
                pos = [rand(0...@grid.length), rand(0...@grid.length)]
                self[pos] = card.face_value if self[pos] == "_"
            end
            
        end
    end

    def print
        @grid.each do |row| 
            puts row.join(" ")
        end
    end

end

board = Board.new
# p board.populate(:X)
p board.print
p board.create_deck
p board.populate
p board.print
# p board.size
p board.deck
