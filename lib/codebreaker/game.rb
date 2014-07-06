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
      # plus = ""
      # minus = ""
      # ind = []

      # code.each_with_index do |i, v|
      #   if @secret_code[i] == code[i]
      #     plus += "+"
      #     ind << i
      #   end
      # end

      # i = 0

      # while i < @secret_code.length
      #   if code[i] != @secret_code[i]
      #     i = 0
      #     while i < code.length
      #       if !ind.include?(i) && code[i] == @secret_code[i]
      #         minus += "-"
      #         ind << i
      #       end
      #       i += 1
      #     end
      #   end
      #   i += 1
      # end
      # result = plus + minus
      # @output.puts(result)


      plus = ""
      minus = ""
      no = ""

code.each_with_index do |i, v|
  if @secret_code[i] == code[i]
    plus += "+"
  elsif @secret_code.include? code[i]
    minus += "-"
  end
end

      result = plus + minus
      @output.puts(result)
    end



    private

    def generate
      @secret_code = (1..6).to_a.sample 4
    end
  end
end
