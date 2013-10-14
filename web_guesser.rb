require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess.to_i == SECRET_NUMBER
    message = "You got it right"
  elsif guess.to_i > (SECRET_NUMBER + 5)
    message = "Way too high"
  elsif guess.to_i < (SECRET_NUMBER - 5)
    message = "Way too low"
  elsif guess.to_i < SECRET_NUMBER
    message = "too low"
  elsif guess.to_i > SECRET_NUMBER
    message = "too high"
  end
end
