# - User inputs question
# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits
#
# Bonus Objectives:
# - ability to add more answers:
# - via easter egg question ("add_answers")
# - do not let them add the same answer if the eight ball already has that answer
#
# - ability to reset answers back to original bank (hint: think arr.clone)
# - via easter egg question ("reset_answers")
# - ability to have eight ball print all answers
# - via easter egg question ("print_answers")
puts
puts "~~~ MAGIC 8 BALL ~~~"
def main_menu()
  puts "\n~~~ MAIN MENU ~~~"
  puts "1: Get Started"
  puts "2: Exit"
  puts "* Make a Selection *"
  case gets.strip.downcase
  when "1"
    answer_question()
  when "2", "exit"
    puts "\nThanks for playing MAGIC 8-BALL! Come Again!"
    exit
  else
    puts "Invalid Input"
    main_menu
  end
end

def answer_question()
  @possible_answers[:custom] << @possible_answers[:default]
  @possible_answers[:custom].flatten!.uniq!
  puts "\nAsk any question, or type done to return to the Main Menu."
  user_question = gets.strip.downcase
  case user_question
  when "done"
  when "add_answers"
    puts "Fine. Put your own answer."
    puts "Current Answers: "
    puts @possible_answers[:custom]
    puts "Enter new answer: \n"
    new_answer1 = gets.strip
    @possible_answers[:custom] << new_answer1
    answer_question
  when "reset_answers"
    @possible_answers[:custom] = []
    answer_question
  when "print_answers"
    puts @possible_answers[:custom]
    answer_question
  else
    if user_question.include? "?"
      if @possible_answers.has_key? user_question
        puts "Magic 8-Ball Says: #{@possible_answers[user_question]}"
      else
          puts "Magic 8-Ball Says: #{@possible_answers[:custom].sample}"
      end
      answer_question
    else
      puts "That is not a question, Where is your question mark?"
      answer_question
    end
  end
end

# def custom_answer
#   puts "Fine. Put your own answer."
#   puts "Current Answers:"
#   puts @possible_answers[:custom]
#   puts "Enter new answer:\n"
#   new_answer = gets.strip
#   if new_answer.downcase == "start over"
#     @possible_answers[:custom] = []
#   else
#   @possible_answers[:custom] << new_answer
#   # @possible_answers[:custom] << @possible_answers[:default]
#   # @possible_answers[:custom].flatten!.uniq!
#   end
#
# end


@possible_answers = {
  "is cael going to get married this year?" => "Yes, He is going to get married",
  "what is the meaning of life?" => "42",
  "do you like wendys?" => "WHENDEEZ nuts",
  "why's james crying?" => "Cuz he just got DUNKED ON!",
  :default => [
    "Yes",
     "No",
     "Hmmmm..... Try Back Later",
    "Without A Doubt",
    "Use your brain on that one",
    "Totally!",
    "Unfortunately",
    "Undeniable So",
    "Why would you even ask that? OF COURSE!",
    "Signs point to yes."
  ],
  :custom => []
}



while true
  main_menu()
end
