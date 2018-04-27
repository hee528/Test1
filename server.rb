
require 'sinatra'     # this declares that we are using the web frame SINATRA
require './block'     # this calls the block file

b = Blockchain.new    # we declared a class called 'b'

get '/' do			  # get / do prints out to a local host

	message = ""

	b.all_chains.each do |a| # 모든 블록들이 매번 A라는 이름으로 저장돼서 돌게 됨

	message << "번호는 : " + a['index'].to_s + "<br>"  	# a is the given block
	message << "Nonce는 : " + a['nonce'].to_s + "<br>"
	message << "시간은 : " + a['time'].to_s + "<br>"	
	message << "앞 주소는 : " + a['previous_address'].to_s + "<br>"
	message << "내 주소는 : " + Digest::SHA256.hexdigest(a.to_s) + "<br>"	# 블럭 해쉬 값  
	message << "<hr>"	# horizon rule

	end 

message 

end

get '/mine' do
	b.mining.to_s     # this brings the last value of the "mining" part of the block file
					  # to.s changes the number '0' to text '0' (string)
end
