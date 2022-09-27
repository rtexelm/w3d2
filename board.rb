require "byebug"
class Board
    attr_reader :size, :grid, :deck
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size, "_")}
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

    def populate(face_value)

        while @grid.flatten.count(face_value) < 2
            pos = [rand(0...@grid.length), rand(0...@grid.length)]
            self[pos] = face_value if self[pos] == "_"
        end
        
        return true if @grid.flatten.count(face_value) == 2
        false
    end

    def print
        @grid.each do |row| 
            puts row.join(" ")
        end
    end
        # (:A..:Z).to_a.sample
end

board = Board.new(3)
p board.print
p board.populate(:X)
p board.print
p board.size
p board.deck
