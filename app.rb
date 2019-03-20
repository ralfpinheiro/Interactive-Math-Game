require './players.rb'
require './questions.rb'

class Game
    def initialize
    puts "Ready to start?"
    sleep(1)
    puts "Please enter your name, PLAYER 1:"
    name1 = gets.chomp
    #Initialize player 2
    @player1 = Players.new(name1)
    puts "Please enter your name, PLAYER 2:"
    name2 = gets.chomp
    #Initialize player 2
    @player2 = Players.new(name2)
    sleep(1)
    puts "Lets begin, #{@player1.name} and #{@player2.name}"
end

# Make question
def question
    question = Question.new
    @query = question.question
    @ans = question.answer
    sleep(1)
    puts "--- NEW QUESTION ---"
    #checks for players turn
    if @player1.turn
        sleep(1)
        puts "- #{@player1.name} -"
        puts "#{@query}"
    else
        sleep(1)
        puts "- #{@player2.name} -"
        puts "#{@query}"
    end
end

#Check answer
def check_answer
    if STDIN.gets.chomp.to_i == @ans
        if @player1.turn
            puts "Correct answer!"
            @player1.turn = false
            @player2.turn = true
            life
            win?
        else
            puts "Correct answer!"
            @player1.turn = true
            @player2.turn = false
            life
            win?
        end
    else
        if @player1.turn
            puts "Wrong answer #{@player1.name}!"
            @player1.life -= 1
            @player1.turn = false
            @player2.turn = true
            sleep(1)
            puts "The correct answer was #{@ans}"
            life
            win?
        else
            @player2.turn
            @player2.life -= 1
            puts "Wrong answer #{@player2.name}"
            @player1.turn = true
            @player2.turn = false
            sleep(1)
            puts "The correct answer was #{@ans}"
            life
            win? 
        end
    end
end

#Scoreboard
def life
    sleep(1)
    puts "Scoreboard:"
    puts "#{@player1.name}: #{@player1.life.to_s}/3 -- #{@player2.name}: #{@player2.life.to_s}/3"
end

#Player turn
def turn
    question
    check_answer
end

#Check if the game is over
def game_over?
    @life <= 0
end

#Check for a winner
def win?
    if @player1.life == 0
        sleep(1)
        puts "-- GAME OVER --"
        sleep(1)
        puts "#{@player2.name} wins!"
        sleep(1)
    elsif @player2.life == 0
            sleep(1)
            puts "-- GAME OVER --"
            sleep(1)
            puts "#{@player1.name} wins!"
            sleep(1)
        else
            turn
        end
    end

end 