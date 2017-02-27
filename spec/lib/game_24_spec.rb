require "game_24"

RSpec.describe Game24Calculator, :type => :lib do
  it "generates the answers of [3, 3, 6, 6]" do
    answers = Game24Calculator.new(array: [3, 3, 6, 6]).work
    expect(answers.size).to eq(1)
    answers.each do |answer|
      expect(eval(answer)).to eq(24.0)
    end
  end

  it "generates the answers of [3 2 3 4]" do
    answers = Game24Calculator.new(array: [3, 2, 3, 4]).work
    expect(answers.size).to eq(0)
  end

  it "generates the answers of [5, 5, 6, 6]" do
    answers = Game24Calculator.new(array: [5, 5, 6, 6]).work
    expect(answers.size).to eq(5)
    answers.each do |answer|
      expect(eval(answer)).to eq(24.0)
    end
  end
end
