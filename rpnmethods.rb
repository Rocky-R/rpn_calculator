module RPNMethods

  INPUT_INDICATOR = '> '
  OPERATORS = %w(+ - * / **)
  END_OF_INPUT = 'q'

  def print_input_indicator
    print INPUT_INDICATOR
  end

  def parse_input(input)
    if OPERATORS.include?(input)
      process_operator(input)
    else
      stack.push(input.to_f)
    end
  end

  def print_last_value
    value = stack.last
    p value.round(2)
  end
  
  def process_operator(operator)
    return unless stack.count >= 2
  
    arg1, arg2 = stack.slice!(-2, 2)
    result = arg1.send(operator, arg2)
    stack.push(result)
  end
end