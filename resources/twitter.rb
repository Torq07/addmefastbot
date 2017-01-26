module Twitter

	def tw_tweet
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.a(text:'Twitter Tweets').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',text:'Tweet').click
		print 'Twitter Tweets: '
		sleep 1
		@b.browser.window(index:1).use
		@b.browser.button(value:'Tweet').click
		sleep 1
		@b.browser.window(index:0).use
		puts 'Success'
		sleep 1+rand(2)
	rescue		
		puts 'Fail tweet'
		# @b.browser.window.close
	end

	def tw_retweet
		@b.browser.execute_script("window.scrollBy(0,400)")
		@b.browser.a(text:'Twitter Retweets').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',text:'Retweet').click
		print 'Twitter ReTweets: '
		sleep 1
		@b.browser.window(index:1).use
		@b.browser.button(value:'Retweet').click
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(index:0).use
		sleep 1+rand(2)
	rescue		
		puts 'Fail retweet'
		@b.browser.window.close
	end

	def tw_fav
		@b.browser.execute_script("window.scrollBy(0,400)")
		@b.browser.a(text:'Twitter Favorites').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',text:'Favorite').click
		print 'Twitter Favorites: '
		sleep 1
		@b.browser.window(index:1).use
		@b.browser.button(value:'Like').click
		@b.browser.window.close
		@b.browser.window(index:0).use
		puts 'Success'
		sleep 1+rand(2)
	rescue		
		puts 'Fail tw_favorites'
		@b.browser.window.close
	end	

	def tw_follow
		@b.browser.execute_script("window.scrollBy(0,400)")
		@b.browser.a(text:'Twitter Followers').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',text:'Follow').click
		print 'Twitter Followers: '
		sleep 1
		@b.browser.window(index:1).use
		@b.browser.button(text:'Follow').click
		@b.browser.window.close
		@b.browser.window(index:0).use
		puts 'Success'
		sleep 1+rand(2)
	rescue		
		puts 'Fail tw_follow'
		@b.browser.window.close
	end	
end	