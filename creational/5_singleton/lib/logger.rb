require 'singleton'
#singleton #2
class Logger
  include Singleton

  def initialize
    @log = File.open('log.txt', 'a+')
    @log.sync = true
  end

  def log(msg)
    @log.puts(msg)
  end
end

