
class Blockchain               #172608			   

	def mining

		history = []		   #history has a list. its left empty.



    	begin 					# In ruby, BEGIN/END is the same as "Loop"

    		nonce = rand(100000) # 일반 블럭체인은 이렇게 상한선을 정하지 않음 

    		history << nonce	#nonce값이 나올때마다 history에 밀어 넣기 

    		hashed = Digest::SHA256.hexdigest(nonce.to_s) # HASHED value equals nonce (in strong), encrypted using SHA256

    	end while hashed[0..3] != "0000" # take the first four digits (0~3) of the hashed value. loop until the value is "0000"
    								# 채굴 난이도는 이 라인에서 결정됨. 하지만 함부로 쓰면 무한 루프 됨ㅠ 

    	 history.size 		# this prints out to screen. PUTS prints to black screen
    						# this method prints to a web screen
	end

end

