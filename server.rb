
require 'sinatra'     # this declares that we are using the web frame SINATRA
require './block'     # this calls the block file

b = Blockchain.new    # we declared a class called 'b'

get '/' do			  # get / do prints out to a local host
	b.all_chains.to_s 
end

get '/mine' do
	b.mining.to_s     #this brings the last value of the "mining" part of the block file
					  # to.s changes the number '0' to text '0' (string)
end
