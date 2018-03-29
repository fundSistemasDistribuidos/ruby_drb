require 'drb/drb'

class Calculator
  def calc(op, op1, op2)
    resp = 0
    case op
      when '+'
        resp = op1 + op2
      when '-'
        resp = op1 - op2
      when '*'
        resp = op1 * op2
      when '/'
        resp = op1 / op2
    end
    resp
  end
end


URI = "druby://#{ARGV.first}"
FRONT_OBJECT = Calculator.new

puts 'Starting Server...'
DRb.start_service(URI, FRONT_OBJECT)
puts "Listening on #{URI}"
DRb.thread.join
