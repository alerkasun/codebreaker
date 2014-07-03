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
      res_plus = ""
      res_min = ""
      ind = []
    end

    private

    def generate
      @secret_code = (1..6).to_a.sample 4
    end
  end
end
