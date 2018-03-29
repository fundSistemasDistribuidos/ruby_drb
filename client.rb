require 'drb/drb'

URI = "druby://#{ARGV.first}"

puts "Digite apenas o sinal da operacao:"
op = STDIN.gets.chomp
puts "Digite o operando1:"
op1 = STDIN.gets.chomp
puts "Digite o operando2:"
op2 = STDIN.gets.chomp

DRb.start_service
calculator = DRbObject.new_with_uri(URI)

puts "A resposta eh: #{calculator.calc(op, op1.to_i, op2.to_i)}"
