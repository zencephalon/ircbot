require 'cinch'
load "aliza.rb"

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = "ALIZA"
    c.channels = ["#hackny"]
  end

  on :connect do |m|
      ALIZA = Aliza.new(m.bot.nick)
  end

  on :message, /.*/ do |m|
      response = ALIZA.hear(m.user.nick, m.message) 
      m.reply response unless response.nil?
  end
end

bot.start
