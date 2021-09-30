require "tty-box"

# Render swing graphic and visualize pitch
def swing (pitch = 0, text = " ",swing_index)

    # At default, all pitch positions in strikezone are empty
    p1 = " "
    p2 = " "
    p3 = " "
    p4 = " "
    p5 = " "
    p6 = " "
    p7 = " "
    p8 = " "
    p9 = " "
    p10 = " "
    p11 = " "
    p12 = " "
    p13 = " "
    p14 = " "
    p15 = " "
    p16 = " "

    # At default, all swing positions are empty
    sw_h = "     "
    sw_m = "     "
    sw_l = "     "

    # Initialize swing variables to match with swing passed in
    swing_range = swing_index
    high_range = 2..4
    mid_range = 7..9
    low_range = 12..14

    # For swing, replace with "=" to visualize swing
    if swing_range == high_range
        sw_h = "D===="
        p2 = "="
        p3 = "="
        p4 = "="
    elsif swing_range == mid_range
        sw_m = "D===="
        p7 = "="
        p8 = "="
        p9 = "="
    elsif swing_range == low_range
        sw_l = "D===="
        p12 = "="
        p13 = "="
        p14 = "="
    end

    # For pitch, replace with "O" to visualize pitch location
    case pitch
    when 1
        p1 = "O"
    when 2
        p2 = "O"
    when 3
        p3 = "O"
    when 4
        p4 = "O"
    when 5
        p5 = "O"
    when 6
        p6 = "O"
    when 7
        p7 = "O"
    when 8
        p8 = "O"
    when 9
        p9 = "O"
    when 10
        p10 = "O"
    when 11
        p11 = "O"
    when 12
        p12 = "O"
    when 13
        p13 = "O"
    when 14
        p14 = "O"
    when 15
        p15 = "O"
    end
        
    # Render swing graphic in tty-box with pitch location and swing location
    choose_swing_box = TTY::Box.frame(width: 100, height: 22, border: :thick) do
    "
                                                              0
                                                            (|\\ 
                                                        ____|| o
                                                        *    | 
                                                             |_
                                                     ..~~'''''''~~..
                                  
                                 
                                    __
                                   [__]__              Choose your swing:
                                  _| *|      +---+
                                 |____|#{sw_h}#{p1}|#{p2}#{p3}#{p4}|#{p5}   1. HIGH
                                 | || |#{sw_m}#{p6}|#{p7}#{p8}#{p9}|#{p10}   2. MID
                                 | || |#{sw_l}#{p11}|#{p12}#{p13}#{p14}|#{p15}   3. LOW
                                 |====|      +---+
                                 ||  \\\\                #{text}
                                 //   ||
                                GO    OD
                                                                                                    
    "
    end

    puts choose_swing_box

end