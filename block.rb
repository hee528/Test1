
class Blockchain               # 172608

	def initialize

		@chain = []			   # 블록체인이라는 게 생기면 앞으로 이 리스트로 관리 
							   # 골뱅이가 있으면 다른 곳에서도 사용 가능!

		@transaction = []
	end 

	def trans(s, r, a)	# we are declaring that these three elements mandatory in a transaction!
					  	# this references back to the b.trans line in the server.rb file
		puts s 	 	  	# the first value will automatically be "s" (as in, sender)
		puts r  		# the second value is automatically "r" (as in, receiver)
		puts a   		# the third value becomes "a" (amount)

	end

	def mining

		history = []		     # history has a list. its left empty.

    	begin 					 # In ruby, BEGIN/END is the same as "Loop"

    		nonce = rand(100000) # 일반 블럭체인은 이렇게 상한선을 정하지 않음 

    		history << nonce	 # nonce값이 나올때마다 history에 밀어 넣기 

    		hashed = Digest::SHA256.hexdigest(nonce.to_s)  

    							 # HASHED value equals nonce (in strong), encrypted using SHA256
    							 # DIGEST 라는 단어는 루비에서 해쉬랑 비슷함 (무언가를 소화해서 내것으로 만드는)

    	end while hashed[0..3] != "0000" 
    							# take the first four digits (0~3) of the hashed value. loop until the value is "0000"
    							# 채굴 난이도는 이 라인에서 결정됨. 하지만 함부로 쓰면 무한 루프 됨ㅠ 

    	block = 

    	{ 
    		"index" => @chain.size + 1,
    		"time" => Time.now, 			# the time it takes to mine
    		"nonce" => nonce,
    		"previous_address" => Digest::SHA256.hexdigest(last_block.to_s)   # 앞주소는 해쉬값 
    	}				
    							
    	@chain << block			# chain이 나올때마다 block에 밀어 넣기 			
    							
								# ruby에서의 해쉬는 암호화폐 해쉬랑 다름! 	
								# in ruby, hash is a collection of equalities (a=b)
    							# in python, this is called "DICTIONARY"

    	 history.size 		# this prints out to screen. PUTS prints to black screen
    						# this method prints to a web screen
	end


	def last_block

		@chain[-1]			# a[0]은 첫번째 자리. a[-1]는 마지막, [-2]는 마지막에서 두번째

	end


	def all_chains

		@chain 

	end 

end

