
# Author: Corey Nagel
# email: corey.nagel@colorado.edu
# github for this file: https://github.com/coreynagel/Lab2.git


# Part1: Hello World
class HelloWorldClass
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
        puts "Hello #{@name}!"
    end
end
hello = HelloWorldClass.new("Corey Nagel")
hello.sayHi

# PART 2: STRINGS

# Part 2: A) Palindrome

def palindrome?(string)
	puts string
	string.downcase!
	string = string.gsub(/\W+/, '')
	if string === string.reverse
		return true
	else
		return false
	end
end

# test palindrome
puts "\n"
puts "Palindrome Tests\n\n"
puts palindrome?("A man, a plan, a canal -- Panama") # => true
puts palindrome?("Madam, I'm Adam!")                 # => true
puts palindrome?("Abracadabra")            # => false (nil is also ok) 
puts "\n"


# Part 2 - B) Count words

def count_words(string)
	puts string
	string.downcase!
	string = string.gsub(/\W+/, ' ')
	string = string.split(/\b/)
	wordhash = Hash.new
	string.each do |word| 
		if wordhash.has_key?(word)
			wordhash[word] += 1
		elsif word === " "
		
		else
			wordhash[word] = 1
		end
	end
	puts wordhash
end


puts "Count Words Tests\n\n"
puts count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}

# PART 3: ROCK PAPER SCISSORS

class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game[0][1].match(/[rpsRPS]/) && game[1][1].match(/[rpsRPS]/)
	game[0][1].upcase!
	game[1][1].upcase!

	

	if game[0][1] === game[1][1]
		return game[0]
	else
		if game[0][1] === 'R'
			if game [1][1] === 'S'
				return game[0]
			else 
				return game[1]
			end
		elsif game[0][1] === 'S'
			if game[1][1] === 'P'
				return game[0]
			else 
				return game[1]
			end
		else	# p1 === P
			if game[1][1] === 'R'
				return game[0]
			else
				return game[1]
			end
		end
	end
end

puts "rps_game_winner TEST"
testgame = [["Armando", "R"], ["Dave", "S"]]
puts testgame.to_s
winner = rps_game_winner(testgame)
puts "winner = " + winner.to_s + "\n\n"

def rps_tournament_winner(tournament)
	round_winners = Array.new()
	puts tournament.to_s
	if tournament[0][0].class != round_winners.class
		tournament = rps_game_winner(tournament)
		puts tournament.to_s + "Round Winner"
		return tournament
	end
	rps_tournament_winner([rps_tournament_winner(tournament[0]),
						   rps_tournament_winner(tournament[1])])
	
end

tournament1 =[
    	[
        	[ ["Armando", "P"], ["Dave", "S"] ],
        	[ ["Richard", "R"],  ["Michael", "S"] ],
    	],
    	[
       		[ ["Allen", "S"], ["Omer", "P"] ],
        	[ ["David E.", "R"], ["Richard X.", "P"] ]
    	]
	]

puts "rps_tournament_winner TEST\n\n"
puts rps_tournament_winner(tournament1).to_s + "Grand Champion"
