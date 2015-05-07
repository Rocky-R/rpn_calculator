require './rpnmethods'

class RPNCalculator
  attr_reader :stack
  include RPNMethods
 
  def initialize
    @stack = []
  end

  def run
    print_input_indicator
    input = $stdin.gets.chomp

    until input == END_OF_INPUT
      parse_input(input)
      print_last_value
      print_input_indicator
    end
  end
end
