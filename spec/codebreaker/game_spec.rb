require 'spec_helper'

module Codebreaker
  describe Game do
    let(:game) { Game.new(output) }
    let(:output) { double('output').as_null_object }
    describe "#start" do

      it "generates secret code" do
        expect(game).to receive(:generate)
        game.start
      end

      it "saves 4 numbers secret code" do
        game.start
        #expect(game.instance_variable_get(:@secret_code)).to have(4).items
        expect(game.instance_variable_get(:@secret_code).length).to be(4)
      end

      it "saves secret code with numbers from 1 to 6" do
        game.start
        expect(game.instance_variable_get(:@secret_code) - (1..6).to_a).to be_empty
      end

      it "sends a welcome message" do
        expect(output).to receive(:puts).with('Welcome to Codebreaker!')
        game.start
      end

      it "prompts for the first guess" do
        expect(output).to receive(:puts).with('Enter guess:')
        game.start
      end
    end

    describe "#guess" do
      {
        [1, 2, 3, 4] => '++++',
        [5, 6, 6, 6] => '',
        [1, 1, 3, 4] => '+++-',
        [5, 6, 5, 6] => '',
        [4, 3, 1, 2] => '----',
        [1, 5, 5, 6] => '+',
        [5, 2, 3, 1] => '++-'
      }.each do |arg, result|
        it "correctly display numbers for #{arg}" do
            stubbed_secret_code = [1, 2, 3, 4]
            game.start
            game.instance_variable_set(:@secret_code, stubbed_secret_code)
            expect(output).to receive(:puts).with(result)
            game.guess(arg)
          end
      end

      it "display You lose if 10 times wrong" do
        game.start
        9.times {game.guess [1, 2, 3, 4]}
        expect(output).to receive(:puts).with("You lose! HA HA")
        game.guess [1, 2, 3, 4]
      end

      it "display You win if ++++" do
        stubbed_secret_code = [1, 2, 3, 4]
        game.start
        game.instance_variable_set(:@secret_code, stubbed_secret_code)
        expect(output).to receive(:puts).with('++++')
        expect(output).to receive(:puts).with('You win')
        game.guess(stubbed_secret_code)
      end


      describe "#hint" do
        it "showed one random number of secret code" do
          stubbed_secret_code = [1, 2, 3, 4]
          game.start
          game.instance_variable_set(:@secret_code, stubbed_secret_code)
          expect(stubbed_secret_code).to include(game.hint)
          expect(game.hint).to eq("You haven't hint")
        end
      end
    end
  end
end
