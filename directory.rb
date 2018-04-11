@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def add_students(name, cohort, birthday, country)
  @students << {name: name, cohort: cohort.to_sym, birthday: birthday, country: country}
end

def input_students
  puts "Please enter the student's details"
  puts "To finish, just hit return twice"

  puts "Student Name: "
  name = STDIN.gets.chomp

  while !name.empty? do
     puts "Cohort: "
     cohort = STDIN.gets.chomp
     cohort = "unknown" if cohort == ""
     puts "Date of Birth (e.g. 01 Jan 1985): "
     birthday = STDIN.gets.chomp
     puts "Citizenship: "
     country = STDIN.gets.chomp
   
    add_students(name, cohort, birthday, country)
    print_summary
    puts "Enter next student's details"
    puts "Student Name: "
    name = STDIN.gets.chomp
  end
end

def print_summary
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(75)
  else
    puts "Overall, we have #{@students.count} great students".center(75)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:birthday], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, birthday, country = line.chomp.split(',')
    add_students(name, cohort.to_sym, birthday, country)
  end
  file.close
end

def try_load_students
  ARGV.first != nil ? filename = ARGV.first : filename = "students.csv" 
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist. Loading from students.csv"
    load_students
  end
end

try_load_students
interactive_menu