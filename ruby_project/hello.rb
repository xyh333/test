
def f(n1,n2)
  n1.to_f * n2.to_f
end

puts "enter 1st number"
n1 = gets.chomp
puts "enter 2nd number"
n2 = gets.chomp


prompt = gets.chomp
if prompt == '1'
    result = f(n1,n2)
else
    result = 0
end

puts "result = #{result}"