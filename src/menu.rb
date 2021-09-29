require "tty-box"
require "tty-font"

def menu()

    title19 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
         _ 
        | |
        | |
        |_|
        (_)
        "
    end

    title18 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
        _    _ 
         \\  | |
        ) | | |
        _/  |_|
            (_)
        "
    end

    title17 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
         ____    _ 
        |  _ \\  | |
        | |_) | | |
        |  __/  |_|
        |_|     (_)
        "
    end

    title16 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
         _   ____    _ 
        | | |  _ \\  | |
        | | | |_) | | |
        | | |  __/  |_|
        _/  |_|     (_)
        "
    end

    title15 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
         _   _   ____    _ 
        | | | | |  _ \\  | |
        | | | | | |_) | | |
        | |_| | |  __/  |_|
         \\___/  |_|     (_)
        "
    end

    title14 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
             _   _   ____    _ 
            | | | | |  _ \\  | |
        __  | | | | | |_) | | |
        __| | |_| | |  __/  |_|
             \\___/  |_|     (_)
        "
    end

    title13 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
                 _   _   ____    _ 
                | | | | |  _ \\  | |
         _____  | | | | | |_) | | |
        |_____| | |_| | |  __/  |_|
                 \\___/  |_|     (_)
        "
    end

    title12 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
                     _   _   ____    _ 
        __          | | | | |  _ \\  | |
        __|  _____  | | | | | |_) | | |
            |_____| | |_| | |  __/  |_|
                     \\___/  |_|     (_)
        "
    end

    title11 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
                         _   _   ____    _ 
          _ __          | | | | |  _ \\  | |
         | '__|  _____  | | | | | |_) | | |
         | |    |_____| | |_| | |  __/  |_|
         |_|             \\___/  |_|     (_)
        "
    end

    title10 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
                             _   _   ____    _ 
        ___   _ __          | | | | |  _ \\  | |
         _ \\ | '__|  _____  | | | | | |_) | | |
         __/ | |    |_____| | |_| | |  __/  |_|
        ___| |_|             \\___/  |_|     (_)
        "
    end

    title9 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
                                 _   _   ____    _ 
            ___   _ __          | | | | |  _ \\  | |
        |  / _ \\ | '__|  _____  | | | | | |_) | | |
          |  __/ | |    |_____| | |_| | |  __/  |_|
        |  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title8 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
         _                           _   _   ____    _ 
        | |_    ___   _ __          | | | | |  _ \\  | |
        | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
         \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title7 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                               
             _                           _   _   ____    _ 
        |_  | |_    ___   _ __          | | | | |  _ \\  | |
        __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
        __|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title6 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                                   
           _     _                           _   _   ____    _ 
          | |_  | |_    ___   _ __          | | | | |  _ \\  | |
        | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
        |  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title5 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                                       
               _     _                           _   _   ____    _ 
        __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
         _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
        __,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title4 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                                           
                   _     _                           _   _   ____    _ 
            __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
           / _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        | | (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
           \\__,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title3 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
                                                                               
        ___            _     _                           _   _   ____    _ 
        __ )    __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
         _ \\   / _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
        |_) | | (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
        ___/   \\__,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title2 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
        
           ____            _     _                           _   _   ____    _ 
          | __ )    __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
          |  _ \\   / _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
          | |_) | | (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
          |____/   \\__,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title1 =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
            
               ____            _     _                           _   _   ____    _ 
              | __ )    __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
              |  _ \\   / _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
              | |_) | | (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
              |____/   \\__,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end

    title =  TTY::Box.frame(width: 100, height: 12, border: :thick) do
        "
            
      .~''''~.     ____            _     _                           _   _   ____    _ 
     / \\    / \\   | __ )    __ _  | |_  | |_    ___   _ __          | | | | |  _ \\  | |
    {   }  {   }  |  _ \\   / _` | | __| | __|  / _ \\ | '__|  _____  | | | | | |_) | | |
     \\ /    \\ /   | |_) | | (_| | | |_  | |_  |  __/ | |    |_____| | |_| | |  __/  |_|
      '~....~'    |____/   \\__,_|  \\__|  \\__|  \\___| |_|             \\___/  |_|     (_)
        "
    end
    
    sleep(0.1)
    system("clear")
    puts title19
    sleep(0.1)
    system("clear")
    puts title18
    sleep(0.1)
    system("clear")
    puts title17
    sleep(0.1)
    system("clear")
    puts title16
    sleep(0.1)
    system("clear")
    puts title15
    sleep(0.1)
    system("clear")
    puts title14
    sleep(0.1)
    system("clear")
    puts title13
    sleep(0.1)
    system("clear")
    puts title12
    sleep(0.1)
    system("clear")
    puts title11
    sleep(0.1)
    system("clear")
    puts title10
    sleep(0.1)
    system("clear")
    puts title9
    sleep(0.1)
    system("clear")
    puts title8
    sleep(0.1)
    system("clear")
    puts title7
    sleep(0.1)
    system("clear")
    puts title6
    sleep(0.1)
    system("clear")
    puts title5
    sleep(0.1)
    system("clear")
    puts title4
    sleep(0.1)
    system("clear")
    puts title3
    sleep(0.1)
    system("clear")
    puts title2
    sleep(0.1)
    system("clear")
    puts title1    
    sleep(0.1)
    system("clear")
    puts title
end