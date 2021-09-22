# class Batter
#     # define new player
#     def initialize(name)
#         @name = name
#     end

#     @strikes = 0
#     @outs = 0

#     def strike_count 
#         if @strikes == 3
#             outs_count()
#         elsif @strikes < 3
#             @strikes += 1
#         end
#     end

#     def outs_count
#         @outs += 1
#     end
# end

outs = 0
first_base = false
second_base = false
third_base = false

def batter_up ()
    strikes = 0
    balls = 0
    while strikes < 3 || balls < 4
        puts "Choose swing"
        puts "1. Swing high"
        puts "2. Swing mid"
        puts "3. Swing low"
        puts ""
        puts "4. No swing"

        swing = gets.chomp
        pitch = rand(1..15)
        swing_index = 0

        case swing 
        when "1"
            swing_index = 2..4
        when "2"
            swing_index = 7..9
        when "3"
            swing_index = 12..14
        when "4"
            swing_index = 0
        else
            puts "Invalid input! Try again"
        end

        puts "Pitch: " + pitch.to_s

        if swing_index == 0
            if pitch === (2..4) || pitch === (7..9) || pitch === (12..14)
                strikes += 1
                puts "No swing, Strike!"
            else
                balls += 1
                puts "Ball!"
            end
        elsif swing_index === pitch
            puts "Hit!"
            break
        else
            strikes += 1
            puts "Swing and a miss!"
        end
        puts "Strikes: " + strikes.to_s
        puts "Balls: " + balls.to_s
    end

    if strikes == 3
        outs += 1
        puts "Next batter"
    elsif balls == 4
        puts "Batter moves to first"
        outs += 1
    end
end

batter_up()
puts "game over!"