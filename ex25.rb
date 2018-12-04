module Ex25
  
  #this function will break up words for us
  def Ex25.break_words(stuff)
    words = stuff.split(' ')
    return words
  #make it possible to use #words outside of the function(?)
  end
  
  #sorts the words alphabetically
  def Ex25.sort_words(words)
    return words.sort
  end
  
  #prints the first word after shifting it over
  #returns the first element of the array and also
  #deletes it from the array at the same time
  def Ex25.print_first_word(words)
    word = words.shift
    puts word
  end
  
  #prints the last word after popping it off
  #removes the last element of the array after returning it
  def Ex25.print_last_word(words)
    word = words.pop
    puts word
  end
  
  #Takes in a full sentence and returns the sorted words
  def Ex25.sort_sentence(sentence)
    words = Ex25.break_words(sentence)
    return Ex25.sort_words(words)
  end
  
  def Ex25.print_first_and_last(sentence)
    words = Ex25.break_words(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end
    
  #sorts the words then prints the first and last one
  def Ex25.print_first_and_last_sorted(sentence)
    words = Ex25.sort_sentence(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end
  
end