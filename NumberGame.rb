class Play 
    def initialize (low_num, high_num, tries)
        @low_num = low_num
        @high_num = high_num
        @tries = tries
    end
    def run
        printf("It is a number between 0 and %d. \n", @high_num)
        printf("You have %d tries. \n", @tries)
        @try = 1
        @num = rand(@low_num..@high_num)
        @n = -1
        @tries_num = 0 
        while @n != @num && @tries_num <= @tries
            printf ( "try %d of %d: " % [@try, @tries])
            @n = gets.to_i
            @try += 1
            @tries_num += 1
            if @n == @num
                puts("!!!BRAVO!!!")
                break
            elsif @n < @num
                puts("The answer is higher.")
            else
                puts("The answer is lower.")
            end
        end
        puts '-------------------------------------------'
        puts '-------------------------------------------'
        puts "You lost the game."
        printf("the correct number is %d. \n", @num)
    end
end
# MAIN PROGRAM
# Welcome the user
print ("please enter your name: ")
name = gets.chomp.capitalize
puts "Welcome #{name} to the numbers game. \n"
puts '-------------------------------------------'
puts '-------------------------------------------'
#Repeat the game until user refuses to play
is_playing = true
while is_playing 
    while true
        # Ask for difficulty level
        puts ("select a difficulty level: ")
        puts ("e for Easy")
        puts ("m for Medium")
        puts ("d for Difficult")
        level = gets.chomp.capitalize
        if ["e", "m", "d", "E", "M", "D"].include? level
            break
        end
    end
    # Start the game based on the difficulty level
    case level
    when "E"
        play = Play.new(0, 10, 5)
        play.run
    when "M"
        play = Play.new(0, 100, 6)
        play.run
    when "D"
        play = Play.new(0, 1000, 9)
        play.run
    end
    # Check if user wanna try again
    print "Do you wanna try again? y/n: "
    answer = gets.capitalize
    if answer != "Y"
        is_playing = false
    end
end
puts "--------- Thank you for playing this game --------- "