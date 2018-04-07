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
  
  cohorts.uniq.each { |cohort|
    puts "Cohort: #{cohort}"
  students.select { |student|
    puts "#{student[:name]}" +
    "Date of Birth: #{student[:birthday]} ".center(35) +
    "Country of Citizenship: #{student[:country]}" if student[:cohort] == cohort
    }
  }    
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75) if students.count != 1
  puts "Overall, we have #{students.count} great student".center(75) if students.count == 1
end

students = input_students
# nothing happens here until we call the methods
print_header
print(students)
print_footer(students)