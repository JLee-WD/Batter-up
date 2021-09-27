require "tty-box"

def no_swing (pitch = 0, text = " ")

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
        

    choose_swing_box = TTY::Box.frame(width: 100, height: 22, border: :thick) do
    "
                                                          . 0
                                                           V|)
                                                          /\\||
                                                        </   |
                                                            _|
                                 /)                  ..~~'''''''~~..
                                //
                               //
                              //    __
                             //    [__]__              Choose your swing:
                            EO]____| *|      +---+
                            (_________|     #{p1}|#{p2}#{p3}#{p4}|#{p5}   1. HIGH
                                 | || |     #{p6}|#{p7}#{p8}#{p9}|#{p10}   2. MID
                                 | || |     #{p11}|#{p12}#{p13}#{p14}|#{p15}   3. LOW
                                 |====|      +---+
                                 //  ||                #{text}
                                ||    \\\\
                                GO     OD
                                                                                                    
    "
    end

    puts choose_swing_box

end

# choose_swing([1,1,1], 2, 2, 3, 1)

# puts "
# +-----------------------------------------------------------------------+         
# |         /)                                                 [#{second_base}]        |
# |        //                                                .'   '.      |
# |       //                                               .'       '.    |
# |      //    __                                       [#{third_base}]    ( )    [#{first_base}] |
# |     //    [__]__            Choose your swing:         '.       .'    |
# |    EO]    | *|      +---+                                '.   .'      |
# |      @@@@@@@@@|     |   |  1. HIGH                        |[ ]|       |
# |          | || |     |   |  2. MID                                     |
# |          | || |     |   |  3. LOW                                     |
# |          |====|     +---+                                  +----------|
# |          //  ||                                            | HR     #{home_runs.to_s} |
# |         ||    \\\\                                           | S      #{strikes.to_s} |
# |         GO     OD                                          | B      #{balls.to_s} |
# |                                                            | O      #{outs.to_s} |
# +-----------------------------------------------------------------------+
# "
# end

# prompt.select("Choose your swing:", %w(Swing-High Swing-Mid Swing-Low No-Swing))

# puts "         
# +-----------------------------------------------------------------------+
# |                                                               [x]     |
# |                                                             .'   '.   |
# |                                                          [ ]  ( )  [x]|
# |            __                                               '.   .'   |
# |           [__]__                                             |[ ]|    |
# |           | *|      +---+                                             |
# |          |@@@@@@@8==|===|=                                            |
# |          | || |     | o |   Swing and a MISS!                         |
# |          | || |     |   |                                             |
# |          |====|     +---+                                  +----------|
# |          ||  \\\\                                            | HR     4 |
# |         //    ||                                           | S      1 |
# |        GO     OD                                           | B      2 |
# |                                                            | O      2 |
# +-----------------------------------------------------------------------+
# "