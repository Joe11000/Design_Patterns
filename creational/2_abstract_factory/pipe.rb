#!/usr/bin/env ruby
require 'pry'
# require 'byebug'

# class Contestant
#   attr_reader :time, :distance_ran

#   def initialize
#     @distance_ran = 0
#     @time = 0
#   end

#   # returns how long it took to take that step
#   def take_a_step
#     time_to_wait = rand(0.1..3.0)
#     @time += time_to_wait
#     sleep time_to_wait
#     time_to_wait
#   end

#   def <=> other_contestant
#     other_contestant.distance_ran <=> distance_ran
#   end

# end

class Game
  attr_reader :contestants

  def initialize num_of_contestants:, race_length:
    @race_length = race_length
    @contestants ||= Array.new(num_of_contestants, nil)
    @winner = nil
  end

  def start
    binding.pry
    @contestants.map do |contestant|
      Thread.new do
        Thread.current[:time] = 0

        for i in 0..race_length
          time_to_wait = rand(0.0..2.0)
          sleep time_to_wait
          Thread.current[:time] += time_to_wait
        end
      end
    end

    wait_for_everyone_to_finish
    calculate_results!
    results

  end


  def post_results

  end

  def to_s
    puts results
  end

  private
    def results
      @contestants.each{|contestant| contestant.join; }
      puts "Player #{contestants.index(contestant) + 1} is the winner!!!}"
    end

    def wait_for_everyone_to_finish
      @contestants.each(&:join)
    end

    def calculate_results!
      @contestants.sort_by! { |a,b| a[:time] < b[:time] }
    end
end

# g = Game.new(num_of_contestants: 1, distance: 10)
# g.start




# count = 0
# tp = Thread.new do
#   1_000.times do
#     count += 1
#     puts count
#     sleep 0.02
#   end
# end

# tm = Thread.new do
#   1_000.times do
#     count -= 1
#     puts count
#     sleep 0.03
#   end
# end





# mutex = Mutex.new

# count = 0

# tp = Thread.new do
#   1_000_000.times do
#     mutex.synchronize do
#       count += 1
#       # puts count
#     end
#     sleep 0.05
#   end
# end

# sleep 2

# tm = Thread.new do
#   1_000_000.times do
#     mutex.synchronize  do
#       count -= 1
#     end
#     # puts count
#     sleep 0.03
#   end
# end



# #!/usr/bin/ruby
# require 'thread'
# mutex = Mutex.new

# cv = ConditionVariable.new
# a = Thread.new {
#    mutex.synchronize {
#       puts "A: I have critical section, but will wait for cv"
#       sleep 3

#       cv.wait(mutex)
#       puts "A: I have critical section again! I rule!"
#    }
# }
# puts "(Later, back at the ranch...)"

# b = Thread.new {
#    mutex.synchronize {
#       puts "B: Now I am critical, but am done with cv"
#     sleep 3

#       cv.signal
#       puts "B: I am still critical, finishing up"
#    }
# }
# a.join
# b.join



# puts $$
# puts $0
# puts __FILE__
# puts $: # Load path
# pp ENV
# p ARGF
# p ARGV.shift
# p ARGV.shift
# p RUBY_RELEASE_DATE
# STDERR.puts 'yup'
# STDOUT.puts 'yup'

def example1
  count = 0
  mutex = Mutex.new

  t1 = Thread.new do
    Thread.current[:total] = 0
    1.upto(3000) do |i|
      # mutex.synchronize do
        count_new = count
        sleep 0.02
        count_new = i
        sleep 0.02
        count += count_new
        puts count
        Thread.current[:total] += count_new
      # end
    end
    Thread.current[:total]
  end
  sleep 1

  t2 = Thread.new do
    Thread.current[:total] = 0

    (1..3000).each do |i|
      # mutex.synchronize do
        count_new = count
        count_new = i
        count -= count_new
        puts count
        Thread.current[:total] -= count_new
      # end
    end
    Thread.current[:total]
  end
  require 'pry'
  mutex.lock

  # t1.join
  # t2.join

  puts "t1.value #{t1.value}"
  puts "t2.value #{t2.value}"
  puts "count = #{count}."

  puts "t1[:total] = #{t1[:total]}"
  puts "t2[:total] = #{t2[:total]}"
end


def example2
  STDOUT.sync = true
  require 'pry'
  ping = Thread.new do
    STDOUT << "poop\n"
      Thread.wait(2)
      3.times do
        puts 'ping'
        # binding.pry
        Thread.list[-1].wakeup

        sleep
      end
    end

  pong = Thread.new do
      sleep
      # require 'securerandom'
      loop do
        # cv.signal SecureRandom.alphanumeric
        puts 'pong'
        ping.wakeup
        sleep
      end
    end


  require 'pry'
  # binding.pry
  # ping.wakeup;
  ping.wakeup
  ping.join
  pong.join
end

# example2


# pj = Proc.new {|i| i.kill; puts 'terminated' + i}

# END {
#     (Thread.list.reject{|i| i == Thread.main}).each(&pj)
# }



STDOUT.sync = true

loop_a_stopped = true

loop_a = Thread.new do
    loop do
        Thread.stop if loop_a_stopped

        puts 'doing stuff'

        sleep(1)
    end
end

loop_b = Thread.new do
    loop do
        print "> "
        response = gets

        case response.strip.downcase
        when "start"
          loop_a_stopped = false
          loop_a.wakeup
        when "stop"
          loop_a_stopped = true
        when "exit"
          # Terminate thread A regardless of state
          loop_a.terminate!
          # Terminate this thread
          Thread.exit
        end
    end
end

loop_b.join
loop_a.join
