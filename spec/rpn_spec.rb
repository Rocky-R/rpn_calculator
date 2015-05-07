require './spec/spec_helper.rb'

RSpec.describe RPNCalculator do

  before :all do
    @calculator = RPNCalculator.new
  end

  it "zeroes out invalid input" do
    allow($stdin).to receive(:gets).and_return('ok', 'q')
 
    expect { @calculator.run }.to output(/0/).to_stdout
  end
 
  it "allows integer input" do
    allow($stdin).to receive(:gets).and_return('10', 'q')
 
    expect { @calculator.run }.to output(/10/).to_stdout
  end

  it "allows negative numeric input" do
    allow($stdin).to receive(:gets).and_return('-22', 'q')
  
    expect { @calculator.run }.to output(/-22/).to_stdout
  end
 
  it "allows decimal input" do
    allow($stdin).to receive(:gets).and_return('8.6', 'q')
 
    expect { @calculator.run }.to output(/8.6/).to_stdout
  end
 
  it "supports addition" do
    allow($stdin).to receive(:gets).and_return('7', '8', '+', 'q')
 
    expect { @calculator.run }.to output(/15/).to_stdout
  end
 
  it "supports subtraction" do
    allow($stdin).to receive(:gets).and_return('15', '5', '-', 'q')
 
    expect { @calculator.run }.to output(/10/).to_stdout
  end
 
  it "supports multiplication" do
    allow($stdin).to receive(:gets).and_return('2', '6', '*', 'q')
 
    expect { @calculator.run }.to output(/12/).to_stdout
  end
 
  it "supports division" do
    allow($stdin).to receive(:gets).and_return('4', '2', '/', 'q')
 
    expect { @calculator.run }.to output(/2/).to_stdout
  end

  it "does not support zero division" do
    allow($stdin).to receive(:gets).and_return('8', '0', '/', 'q')
  
    expect { @calculator.run }.to raise_error(ZeroDivisionError)
  end

  it "quits when the input is q" do
    allow($stdin).to receive(:gets).and_return('q', '9', 'bob')
  
    expect { @calculator.run }.to output(nil).to_stdout
  end
end
