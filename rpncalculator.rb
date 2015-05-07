require './rpnmethods'
require 'pry-nav'

class RPNCalculator
  include RPNMethods
  attr_reader :stack
  
  def initialize
    @stack = []
  end

  def run
    print_input_indicator

    until (input = $stdin.gets.chomp) == END_OF_INPUT
      parse_input(input)
      print_last_value
      print_input_indicator
    end
  end
end
