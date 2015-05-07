require './rpnmethods'

class RPNCalculator
  include RPNMethods
  attr_reader :stack

  def initialize
    @stack = []
  end

  def run
    show_input_indicator

    until (input = $stdin.gets.chomp) == END_OF_INPUT
      parse_input(input)
      show_last_value
      show_input_indicator
    end
  end
end
