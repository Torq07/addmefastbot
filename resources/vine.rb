module Vine

	def vine_follow
		@b.browser.execute_script("window.scrollBy(0,700)")
		@b.browser.a(:text => 'Vine Followers').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.div(class:'btn3',:text => 'Follow').click
		print 'Vine follow: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.button(:text => 'Follow').click
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

	def vine_revine
		@b.browser.execute_script("window.scrollBy(0,700)")
		@b.browser.a(:text => 'Vine Revines').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.div(class:'btn3',:text => 'Repin').click
		sleep 2+rand(3)
		print 'Revine: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		sleep 2
		@b.browser.element(css:'div.BoardLabel.Module.pinCreate').click
		sleep 2+rand(3)
		@b.browser.window.close
		puts 'Success'
		@b.browser.window(:index => 0).use
		sleep 1+rand(3)
	end

	def vine_like
		@b.browser.execute_script("window.scrollBy(0,700)")
		@b.browser.a(:text => 'Vine Likes').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		@b.browser.div(class:'btn3',:text => 'Like').click
		sleep 2+rand(3)
		print 'Vine Liking: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.span(text:'Like').click
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