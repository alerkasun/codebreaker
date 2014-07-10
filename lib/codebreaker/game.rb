module Codebreaker
  class Game
    def start
      generate
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def initialize(output)
      @output = output
      @number_try = 10
      @win = 0
      @hint = 1
    end

    def guess(code)
      plus = ""
      minus = ""
      no = ""

      code.each_with_index do |v, i|
        if @secret_code[i] == code[i]
          plus += "+"
        elsif @secret_code.include? code[i]
          minus += "-"
        end
      end

      @number_try -= 1
      if @number_try == 0
        @output.puts "You lose! HA HA"
      else
        result = plus + minus
        @output.puts(result)
        @output.puts("You win") if result == '++++'
      end
    end

    def hint
      return "You haven't hint" if @hint == 0
      @hint -= 1
      @secret_code.sample
    end

    private

    def generate
      @secret_code = (1..6).to_a.sample 4
    end
  end
end
