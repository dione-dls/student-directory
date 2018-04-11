def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end
end

def input_students
  puts "Please enter the student's details"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Student Name: "
  name = gets.tr("\n\r","")
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
    students << {name: name, cohort: cohort.to_sym, birthday: birthday, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter next student's details"
    puts "Student Name: "
    name = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end
def print(students)
  if !students.empty?
    cohorts = []
    students.each { |student|
      cohorts.push(student[:cohort])
    }
  end
  
  if cohorts != nil
    cohorts.uniq.each { |cohort|
      puts "Cohort: #{cohort}"
    students.select { |student|
      puts "#{student[:name]}" +
      "Date of Birth: #{student[:birthday]} ".center(35) +
      "Country of Citizenship: #{student[:country]}" if student[:cohort] == cohort
      }
    }
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75) if students.count > 1
  puts "Overall, we have #{students.count} great student".center(75) if students.count == 1
end

students = interactive_menu