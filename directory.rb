@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the student's details"
  puts "To finish, just hit return twice"

  # get the first name
  puts "Student Name: "
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
     puts "Cohort: "
     cohort = gets.chomp
     cohort = "unknown" if cohort == ""
     puts "Date of Birth (e.g. 01 Jan 1985): "
     birthday = gets.chomp
     puts "Citizenship: "
     country = gets.chomp
    # add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym, birthday: birthday, country: country}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Enter next student's details"
    puts "Student Name: "
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end

def print_student_list
  if !@students.empty?
    cohorts = []
    @students.each { |student|
      cohorts.push(student[:cohort])
    }
  end
  
  if cohorts != nil
    cohorts.uniq.each { |cohort|
      puts "Cohort: #{cohort}"
    @students.select { |student|
      puts "#{student[:name]}" +
      "Date of Birth: #{student[:birthday]} ".center(35) +
      "Country of Citizenship: #{student[:country]}" if student[:cohort] == cohort
      }
    }
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(75) if @students.count > 1
  puts "Overall, we have #{@students.count} great student".center(75) if @students.count == 1
end

interactive_menu