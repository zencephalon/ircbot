require 'cinch'
require 'cleverbot-api'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.nick = "aLiZa"
    c.channels = ["#hackny"]
  end

  on :connect do |m|
      ALIZA = CleverBot.new
  end

  on :message, /.*/ do |m|
      if m.user.nick == 'hankcy'
          msg = m.message
          response = ALIZA.think(msg)
          m.reply "#{m.user.nick}: " + response unless response.nil?
      end
  end
end

bot.start
