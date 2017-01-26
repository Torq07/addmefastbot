require_relative 'config'
Dir["./resources/*.rb"].each{ |f| require f }

class Client
	attr_accessor :b

	include Askfm
	include Yt
	include Pinterest
	include Vine
	include Reverbination
	include Twitter

	def initialize
		@b=AppConfigurator.new
		@b.config
		@checks = 75
		@time=Time.now
	end

	def no_items
		@b.browser.b(:text => 'No items in this network for now. Please try later.').exist?
	end	

	def check_available_methods
		approaches = []
		[
		 "yt_subscribe", 
		 "yt_like",
		 "tw_tweet",
		 "tw_retweet",
		 "tw_fav",
		 "tw_follow",
		 "askfm_like", 
		 "pin_repin",
		 "pin_follow",
		 "pin_like",
		 "rvb_fan"
		].each do |a|
			approaches << a if @b.send(a.split('_')[0])
		end
		approaches
	end

	def check_time
		period = Time.now - @time
		if period > 3600
			@checks = 75 
			@time = Time.now
		end	
	end

	def run
		approaches=check_available_methods
		while sleep 1
			check_time
			meth = approaches.sample
			if meth == "yt_subscribe" && @checks>0
				@checks-=1 
				self.send(meth)
			else
				self.send(meth)
			end
		end	
	end

end

begin
	client = Client.new
	client.run
rescue 
	`pkill 'firefox'`
	retry
end	
