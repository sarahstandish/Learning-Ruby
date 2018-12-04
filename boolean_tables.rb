#ex27 Ruby the Hard Way
#https://learnrubythehardway.org/book/ex27.html

boolean_values = {
  "!false" =>	"true",
  "!true" =>	"false",
  "true || false" =>	"true",
  "true || true" => "true",
  "false || true" =>	"true",
  "false || false" =>	"false",
  "true && false" =>	"false",
  "true && true" =>	"true",
  "false && true" =>	"false",
  "false && false" =>	"false",
  "not (true || false)" => "false",
  "not (true || true)" =>	"false",
  "not (false || true)" =>	"false",
  "not (false || false)" =>	"true",
  "!(true && false)" =>	"true",
  "!(true && true)" =>	"false",
  "!(false && true)" =>	"true",
  "!(false && false)" =>	"true",
  "1 != 0" =>	"true",
  "1 != 1" =>	"false",
  "0 != 1" =>	"true",
  "0 != 0" =>	"false",
  "1 == 0" =>	"false",
  "1 == 1" => "true",
  "0 == 1" =>	"false",
  "0 == 0" =>	"true"
}

incorrect_answers = {}

boolean_values.each do |k, v|
  puts "True or false? #{k}:"
  answer = gets.chomp
  if answer == v
    puts "That's right. \n \n"
  else
    puts "Incorrect. #{k} is #{v} \n \n"
    incorrect_answers[k] = v
  end
end

if incorrect_answers.empty?
  puts "Good job! You got them all right the first time."
else
puts "Let's review the #{incorrect_answers.length} items you got wrong: \n"
loop do
  incorrect_answers.each do |k, v|
    puts "True or false? #{k}:"
  answer = gets.chomp
  if answer == v
    puts "That's right. \n \n"
    incorrect_answers.delete(k)
  else
    puts "Incorrect. #{k} is #{v}. \n \n"
  end
end
break if incorrect_answers.empty?
end
end