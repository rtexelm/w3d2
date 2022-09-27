class Card

    attr_reader :revealed

    def initialize(face_value)
        @face_value = face_value
        @revealed = true
    end

    def hide
        @revealed = false if @revealed
    end

    def reveal
        @revealed = true if !@revealed
    end



end



l = Card.new(:L)
p l
p l.revealed
p l.hide
p l.reveal
