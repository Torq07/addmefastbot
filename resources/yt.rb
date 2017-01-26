module Yt

	def yt_subscribe
		@b.browser.execute_script("window.scrollBy(0,400)")
		@b.browser.a(:text => 'YouTube Subscribe').click
		sleep 2+rand(3)
		print 'Yt Subscribing: '
		subscribe
	end

	def yt_like
		@b.browser.execute_script("window.scrollBy(0,400)")
		@b.browser.a(:text => 'YouTube Likes').click
		sleep 2+rand(3)
		print 'Youtube Liking: '
		y_like
	end

	def subscribe
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.div(class:'btn3',:text => 'Subscribe').click
		sleep 2+rand(3)
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.div(class:'primary-header-actions').span(text:'Subscribe').click
		sleep 2+rand(3)
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	rescue		
		puts 'Fail'
		@b.browser.window.close
		@b.browser.window(:index => 0).use
	end


	def y_like
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.div(class:'btn3',:text => 'Like').click
		sleep 2+rand(3)
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.button(title:'I like this').click
		ready = @b.browser.ready_state.eql? "complete"
		until ready
			ready = @b.browser.ready_state.eql? "complete"
			@b.browser.wait
		end	
		sleep 10
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 2
	rescue		
		puts 'Fail'
		@b.browser.window.close
		@b.browser.window(:index => 0).use
	end

end	