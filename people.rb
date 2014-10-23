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
