require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
  
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
  
end
get("/square_root/new") do
  erb(:new_square_root_calc)
end
get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end
get("/payment/results") do
  @the_apr = params.fetch("users_apr").to_f
  @the_apr = @the_apr.round(4)
  @the_years = params.fetch("users_years").to_f

  @the_principal = params.fetch("users_pv").to_f
  r = (@the_apr / 100)
  r = r / 12
  @n = @the_years * 12
  @p = r * (@the_principal) 
  @p = @p / ( 1 - (1 + r) ** -(@n) )
  @p = @p.round(2)
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_number)
end
get("/random/results") do
  @min_num = params.fetch("users_minimum").to_f
  @max_num = params.fetch("users_maximum").to_f
  @random_num =rand(@min_num..@max_num)

  erb(:random_number_results)
end
