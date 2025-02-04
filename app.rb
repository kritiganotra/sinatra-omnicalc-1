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
  apr = params.fetch("user_apr").to_f
  years = params.fetch("user_years").to_i
  principal = params.fetch("user_principal").to_f

  r =(apr/100.0) / 12
  n = years * 12
  
  if r == 0
    payment = principal.to_f
  else
    payment = (r*principal) / (1 - (1 + r) ** -n)
  end

  @formatted_apr = apr.to_fs(:percentage, {:precision => 4})
  @formatted_years = years
  @formatted_principal = principal.to_fs(:currency, { :separator => ".", :delimiter => ",", :precision => 2})
  @formatted_payment = payment.to_fs(:currency, { :precision => 2})

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
