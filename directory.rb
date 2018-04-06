def input_students
  puts "Please enter the student's details"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Student Name: "
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
     puts "Date of Birth: "
     birthday = gets.chomp
     puts "Citizenship: "
     country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, birthday: birthday, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter next student's details"
    name = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
    accumulator = 0
    while accumulator < students.length
      puts "#{students[accumulator][:name]} (#{students[accumulator][:cohort]} cohort), born on #{students[accumulator][:birthday]}, citizen of #{students[accumulator][:country]}".center(60)
      accumulator += 1
    end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
# nothing happens here until we call the methods
print_header
print(students)
print_footer(students)