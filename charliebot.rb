require 'cinch'
require 'cleverbot-api'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = "charliebot"
    c.channels = ["#hackny"]
  end

  on :connect do |m|
      m.reply "Hello, I am Charliebot."
  end

  on :message, /.*/ do |m|
      m.reply "I am both happy and sad at the same time, and I'm still trying to figure out how that could be."
  end
end

bot.start
