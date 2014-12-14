begin

  def speak(str)
    puts "=> #{str}"
  end

  def number_check?(st)
   st.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

    speak "Welcome to my simple calculator program"

    #Ask the user for first number and validate that it is indeed a number 
  begin
    speak "please enter your first number, only numbers allowed"
    num1 = gets.chomp
    speak "you entered #{num1}"
  end until number_check?(num1)
    
   #Ask the user for second number and validate that it is indeed a number  
  begin
    speak "please enter your second number, only numbers allowed"
    num2 = gets.chomp
    speak "you entered #{num2}"
  end until number_check?(num2)

   #Ask the user to select an operator 
    speak "please choose an operator  +(add), -(subtract), *(multiply) , /(divide)"
    operator = gets.chomp
  #Perform the operation based on user's selection
  if operator == "+"
    result = num1.to_f + num2.to_f
    elsif operator == "-"
    result = num1.to_f - num2.to_f
    elsif operator == "*"
    result = num1.to_i * num2.to_i
    elsif
    operator == "/"
    result = num1.to_f/num2.to_f
   
   #Verify that second number is not zero
    while num2.to_f == 0
      puts "cannot divide by zero, please enter second number"
      num2 = gets.chomp
      speak "you entered #{num2}"
      result = num1.to_f/num2.to_f
    end
  end
   speak "result is #{result}"  
 #Ask if user wants to perform another calculation
   speak "Do you want to perform another calculation?,please type Y to continue, anything else to end"
   answer = gets.chomp
end while answer == 'Y'
  










