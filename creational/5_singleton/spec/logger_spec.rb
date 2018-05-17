require_relative 'spec_helper'
require_relative '../lib/logger'
require 'fakefs'

describe 'Logger' do
  include FakeFS::SpecHelpers

  context '' do
    it 'wrote to a file' do
      log_message_1 = "message 1"
      log_message_2 = "message 2"

      FakeFS.with_fresh do
        expect(File.exist? 'log.txt').to eq false

        l = Logger.instance
        expect(Logger.instance).to equal Logger.instance

        expect(File.exist? 'log.txt').to eq true

        f = File.open('log.txt', 'r')
        l.log log_message_1

        expect(f.max).to eq(log_message_1 + "\n")

        l.log log_message_2
        f.rewind
        expect(f.max).to eq(log_message_2 + "\n")
      end
    end
  end
end
