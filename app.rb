require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square_new)
end 

get("/square/results") do
  @square_input = params.fetch("user_square")
  @square_result = params.fetch("user_square").to_f * params.fetch("user_square").to_f
  erb(:square_results)
end

get("/square_root/new")do
  erb(:square_root_new)
end

get("/square_root/results") do
  @squareroot_input = params.fetch("user_squareroot")
  @squareroot_result = Math.sqrt(@squareroot_input.to_f)
  erb(:square_root_results)
end  

get("/payment/new") do
  erb(:payment_new)
end  

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_principal").to_f

  @r =(@apr/100.0) / 12
  @n = @years * 12
  
  if @r == 0
    @result = @principal.to_f
  else
    @result = (@r*@principal) / (1 - (1 + @r) ** -@n)
  end

  erb(:payment_results)

end  

get("/random/new") do
  erb(:random_new)
end 

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @rand = rand(@min..@max)
  erb(:random_results)
end  
