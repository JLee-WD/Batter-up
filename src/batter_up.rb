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

# outs = 0
# first_base = false
# second_base = false
# third_base = false

outs = 0
bases = []
strikes = 0
balls = 0
score = 0

def add_score ()
    until bases.length < 4
        if array[-1] == 1
            score += bases.sum.to_i
            bases.pop
        else
            bases.pop
        end
    end
end

def batter_up ()


    until outs == 3
        until (strikes == 3 || balls == 4 || bases.length >= 4)
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
                puts "HIT!"
                hit_index = rand(1..10)
                if (1..3) === hit_index
                    puts "Line drive!"
                    bases.unshift(1)
                    add_score()
                elsif (4..6) === hit_index 
                    puts "Double!"
                    bases.unshift(0,1)
                    add_score()
                elsif (7..8) === hit_index 
                    puts "Foul Ball!"
                    balls += 1
                elsif hit_index == 9
                    puts "Triple!"
                    bases.unshift(0,0,1)
                    add_score()
                elsif hit_index == 10
                    puts "HOME RUN!"
                    home_run_total = 1
                    bases.each { |i|
                        home_run_total += i
                    }
                    score += home_run_total
                end
            else
                strikes += 1
                puts "Swing and a miss!"
            end
            puts "Strikes: " + strikes.to_s
            puts "Balls: " + balls.to_s
            p bases
            puts "Outs: " + outs.to_s
        end

        if strikes == 3
            outs += 1
            puts "Next batter"
            strikes = 0
            balls = 0
        elsif balls == 4
            puts "Batter moves to first"
            bases.unshift(1)
            strikes = 0
            balls = 0
            add_score()
        end

        if bases.length >= 4
            score += bases.sum.to_i
            bases = []
        end

        puts "score = " + score.to_s
        strikes = 0
        balls = 0
    end
end


batter_up()
puts "game over!"