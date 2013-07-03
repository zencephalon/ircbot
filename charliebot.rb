require 'cinch'
require 'cleverbot-api'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = "charliebot"
    c.channels = ["#hackny"]
  end

  on :connect do |m|
      QUOTES = File.open('perks_quotes.txt').readlines
  end

  on :message, /.*/ do |m|
      if m.message.match(/^#{m.bot.nick}:/)
          m.reply "#{m.user.nick}: " + QUOTES.sample(1).first
      end
  end
end

bot.start
