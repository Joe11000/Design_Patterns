#!/usr/bin/env ruby
# require 'fakefs'

# Singleton Example

require 'rspec/autorun'
#singleton #1
class Government
  @@instance = Government.new

  private_class_method :new

  def self.instance
    @@instance
  end

end


require 'singleton'
#singleton #2
class Logger
  include Singleton

  def initialize
    @log = File.open('log.txt', 'a+')
  end

  def log(msg)
    @log.puts(msg)
  end
end
Logger.instance.log('message 2')



describe Government do
  it 'returns only 1 instance' do
    expect(Government.instance).to equal Government.instance
  end
end



require 'fakefs/safe'
# require 'fakefs/spec_helpers'
require 'pry'
# FakeFS.activate!

describe Logger do
  # include FakeFS::SpecHelpers
  xit 'returns only 1 instance' do
    expect(Logger.instance).to equal Logger.instance
  end

  it 'wrote to a life' do
    log_message_1 = "message 1"
    log_message_2 = "message 2"

    FakeFS.with_fresh do
      binding.pry
      expect(File.exist? 'log.txt').to eq false
      Logger.instance.log log_message_1
      binding.pry

      expect(File.open('log.txt', 'r').readline(-1)).to eq(log_message_1 + "\n")

      Logger.instance.log log_message_2

      expect(File.open('log.txt', 'r').readline(-1)).to eq(log_message_2 + "\n")
    end
  end
end

# FakeFS.deactivate!
