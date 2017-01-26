require 'watir'
require 'yaml'

class AppConfigurator

	attr_accessor :browser
	attr_reader :credentials, :yt,:askfm,:fb,:vk, :ok, :ig, :pin, :vine, :sc, :rvb, :tw

	def initialize
		@credentials = YAML.load(File.open("./credentials.yml"))
		@yt=false
		@askfm=false
		@fb=false
		@vk=false
		@ok=false
		@ig=false
		@pin=false
		@tw=false
		@sc=false
		@rvb=false
		@vine=false
		@browser = Watir::Browser.new :firefox
		@browser.window.maximize
	end

	def config
		twitter
		ask_fm
		vine
		reverbnation
		pinterest
		youtube
		add_me_fast
	end

	def add_me_fast
		login = credentials['addmefast']['login']
		pass = credentials['addmefast']['pass']
		@browser.goto 'http://addmefast.com/?lang=ru'
		gets.chomp
		sleep 1
		@browser.text_field(:name => 'email').set login
		@browser.text_field(:name => 'password').set pass
		@browser.button(name:'login_button').click
	end

	def youtube
		login = credentials['youtube']['login']
		pass =  credentials['youtube']['pass']
		@browser.goto 'https://accounts.google.com/ServiceLogin'
		sleep 3
		@browser.text_field(:name => 'Email').set login
		@browser.button(name:'signIn').click
		sleep 1
		@browser.text_field(:name => 'Passwd').set pass
		@browser.button(value:'Sign in').click
		@yt=true
	end

	# This module is still in progress
	# def instagram
	# 	login = credentials['instagram']['login']
	# 	pass = credentials['instagram']['pass']
	# 	@browser.goto 'https://www.instagram.com/'
	# 	sleep 3
	# 	@browser.a(text:'Log in').click
	# 	sleep 2
	# 	@browser.text_field(:name => 'username').set login
	# 	@browser.text_field(:name => 'password').set pass
	# 	@browser.button(text:'Log in').click
	# 	sleep 5
	# 	@ig=true
	# end

	def ask_fm
		login = credentials['askfm']['login']
		pass = credentials['askfm']['pass']
		@browser.goto 'http://ask.fm/login'
		sleep 3
		@browser.text_field(:name => 'login').set login
		@browser.text_field(:name => 'password').set pass
		@browser.button(type:'submit').click
		continue = gets.chomp
		sleep 3
		@askfm=true
	end

	def pinterest
		login = credentials['pinterest']['login']
		pass = credentials['pinterest']['pass']
		@browser.goto 'https://ru.pinterest.com/'
		sleep 3
		@browser.text_field(:type => 'email').set login
		@browser.text_field(:type => 'password').set pass
		@browser.button(type:'submit').click
		@pin=true
		sleep 5
	end

	def vine
		login = credentials['vine']['login']
		pass = credentials['vine']['pass']
		@browser.goto 'https://vine.co/'
		sleep 3
		@browser.button(text:'Login').click
		sleep 1
		@browser.text_field(:type => 'email').set login
		@browser.text_field(:type => 'password').set pass
		@browser.button(text:'Sign In').click
		@vine=true
		sleep 5
	end

	# This module is still in progress
	# def soundcloud
	# 	login = credentials['soundcloud']['login']
	# 	pass = credentials['soundcloud']['pass']
	# 	@browser.goto 'https://soundcloud.com/'
	# 	@browser.div(class:'frontHero__cta').click
	# 	sleep 1
	# 	@browser.text_field(:id => 'formControl_301').set login
	# 	@browser.button(text:'Continue').click
	# 	sleep 1
	# 	@browser.text_field(:type => 'password').set pass
	# 	@browser.element(css:'button.signinForm__cta.sc-button-cta.sc-button.sc-button-large').click
	# 	@sc=true
	# 	sleep 5
	# end

	def reverbnation
		login = credentials['reverbnation']['login']
		pass = credentials['reverbnation']['pass']
		@browser.goto 'https://www.reverbnation.com/'
		@browser.a(text:'Log In').click
		sleep 1
		@browser.text_field(:id => 'user_login').set login
		@browser.text_field(:id => 'user_password').set pass
		@browser.button(type:'submit').click
		@rvb=true
		sleep 5
	end

	def twitter
		login = credentials['twitter']['login']
		pass = credentials['twitter']['pass']
		@browser.goto 'https://twitter.com/'
		sleep 1
		@browser.text_field(:id => 'signin-email').set login
		@browser.text_field(:id => 'signin-password').set pass
		@browser.td(class:'flex-table-secondary').click
		@tw=true
		sleep 2
	end

end

