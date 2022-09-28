class Card

    attr_reader :revealed, :face_value

    def initialize(face_value)
        @face_value = face_value
        @revealed = false
    end

    def hide
        @revealed = false if @revealed
    end

    def reveal
        @revealed = true if !@revealed
    end

end

