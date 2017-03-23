require 'sinatra'
require 'sinatra/reloader'
NUMBER = rand(0..100)
get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = color(message)
  erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
end
def check_guess(guess)
  if guess == NUMBER
    "You got it right! The SECRET NUMBER is #{NUMBER}."
  elsif guess > NUMBER
    if guess - 5 > NUMBER
      "Way too high!"
    else
      "Too high!"
    end
  else
    if guess + 5 < NUMBER
      "Way too low!"
    else
      "Too low!"
    end
  end
end
def color(message)
  if message == "You got it right! The SECRET NUMBER is #{NUMBER}."
    "green"
  elsif message == "Too high!" || message == "Too low!"
    "#FFCDD2"
  else
    "red"
  end
end
