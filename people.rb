class Person
	attr_accessor :name

	def initialize(name) #Step 4
		@name = name
	end

	def greet #Step 5
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

#Step 6, create instructor named Chris and call greet
chris = Instructor.new("Chris")
chris.greet

#Step 7, create student named Cristina and call greet
cristina = Student.new("Cristina")
cristina.greet

#Step 8, call learn, teach
chris.teach
cristina.learn
cristina.teach # calling "teach" on an instance of class Student results in: people.rb:36:in `<main>': undefined method `teach' for #<Student:0x007fcb53093848 @name="Cristina"> (NoMethodError)
			   # This is because the "teach" method is only defined in the Instructor class and the Student class only inherits from the Person class