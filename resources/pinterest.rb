module Pinterest

	def pin_follow
		@b.browser.execute_script("window.scrollBy(0,800)")
		@b.browser.a(:text => 'Pinterest Followers').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',:text => 'Follow').click
		print 'Pinterest follow: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.button(:text => 'Follow').click
		sleep 2+rand(3)
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	rescue		
		puts 'Fail Pin Follow'
		@b.browser.window(:index => 0).use
	end

	def pin_repin
		@b.browser.execute_script("window.scrollBy(0,800)")
		@b.browser.a(:text => 'Pinterest Repins').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',:text => 'Repin').click
		sleep 2+rand(3)
		print 'Pinterest repin: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		sleep 2
		@b.browser.element(css:'div.BoardLabel.Module.pinCreate').click
		sleep 2+rand(3)
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	rescue		
		puts 'Fail Repin'
	end

	def pin_like
		@b.browser.execute_script("window.scrollBy(0,800)")
		@b.browser.a(:text => 'Pinterest Likes').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items	
		@b.browser.div(class:'btn3',:text => 'Like').click
		sleep 2+rand(3)
		print 'Pinterest Liking: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.span(text:'Like').click
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	rescue		
		puts 'Fail Pin Like'
		@b.browser.window(:index => 0).use
	end

end	