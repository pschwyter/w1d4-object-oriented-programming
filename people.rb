class Student < People
	def learn
		puts "I get it!"
	end
end

class Instructor < People
	def teach
		puts "Everything in Ruby is an Object"
	end
end

class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

