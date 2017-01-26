module Askfm

	def askfm_like
		@b.browser.execute_script("window.scrollBy(0,600)")
		@b.browser.a(:text => 'Ask.fm Likes').click
		sleep 2+rand(3)
		print 'AskFm Liking: '
		a_like
	end

	def a_like
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',:text => 'Like').click
		sleep 2
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.a(class:'icon-like').click
		sleep 1+rand(3)
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	rescue		
		puts 'Fail'
		@b.browser.window.close
		@b.browser.window(:index => 0).use
	end

end