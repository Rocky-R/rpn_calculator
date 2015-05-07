module RPNMethods
  INPUT_INDICATOR = '> '
  OPERATORS = %w(+ - * / **)
  END_OF_INPUT = 'q'

  def show_input_indicator
    print INPUT_INDICATOR
  end

  def parse_input(input)
    if OPERATORS.include?(input)
      process_operator(input)
    else
      stack.push(input.to_f)
    end
  end

  def show_last_value
    value = stack.last
    p value.round(2)
  end

  def process_operator(operator)
    fail 'Not enough operands' unless stack.count >= 2
    fail ZeroDivisionError, 'Can not divide by zero' if
        stack.include?(0) && operator == '/'
  
    arg1, arg2 = stack.slice!(-2, 2)
    result = arg1.send(operator, arg2)
    stack.push(result)
  end
end
