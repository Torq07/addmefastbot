module Reverbination
	def rvb_fan
		@b.browser.execute_script("window.scrollBy(0,1000)")
		@b.browser.a(:text => 'Reverbnation Fans').click
		sleep 2+rand(3)
		@b.browser.execute_script("window.scrollBy(0,200)")
		return if no_items
		@b.browser.div(class:'btn3',:text => 'Become a Fan').click
		print 'Reverbnation Fans: '
		@b.browser.window(:index => 1).use
		@b.browser.window.maximize
		@b.browser.a(:text => 'Become a Fan').click
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
end	