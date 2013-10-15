require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@@guess_checker = 5

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = check_color(message)

  if @@guess_checker == 0
    check_counter
    message = "you have #{@@guess_checker} guesses left"
  end 

  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if guess.to_i == SECRET_NUMBER
    @@guess_checker = 5
    message = "You got it right"
  elsif guess.to_i > (SECRET_NUMBER + 5)
    @@guess_checker -= 1
    message = "Way too high. #{@@guess_checker} guesses left"
  elsif guess.to_i < (SECRET_NUMBER - 5)
    @@guess_checker -= 1
    message = "Way too low. #{@@guess_checker} guesses left"
  elsif guess.to_i < SECRET_NUMBER
    @@guess_checker -= 1
    message = "too low. #{@@guess_checker} guesses left"
  elsif guess.to_i > SECRET_NUMBER
    @@guess_checker -= 1
    message = "too high. #{@@guess_checker} guesses left"
  end
end

def check_color(message)
  if message == "Way too high"
    "red"
  elsif message == "Way too low"
    "blue"
  elsif message == "too low"
    "green"
  elsif message == "too high"
    "yellow"
  elsif message == "You got it right"
    "purple"
  end
end

def check_counter
  @@guess_checker = 5
  "you have #{@@guess_checker} new guesses"
end




