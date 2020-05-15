require "sinatra"


before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get "/throw/:type" do
  player_throw = params[:type].to_sym


  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end


  computer_throw = @throws.sample

  if computer_throw == player_throw
    "That was a tie with computer, Try again!!!"
  elsif computer_throw == @defeat[player_throw]
    "Nice, #{player_throw} beats #{computer_throw}"
  else
    "Damn!!, #{computer_throw} beats #{player_throw}. Better luck next time"
  end
end
