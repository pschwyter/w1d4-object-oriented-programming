class Rover
	attr_accessor :x,:y,:direction

	def initialize(x,y,direction)
		@x = x
		@y = y
		@direction = direction
	end

	def to_s
		"This rover is currently at (#{@x},#{@y}), #{@direction}"
	end

	def read_instruction(instruction)
		@instruction = instruction
	end

	def move
		if @instruction == "M"
			case @direction
			when "N"
				@x += 1
			when "S"
				@x -= 1
			when "E"
				@y += 1
			when "W"
				@y -= 1
			end
		end
	end

	def turn
		if @instruction == "L"
			case @direction
			when "N"
				@direction = "W"
			when "W"
				@direction = "S"
			when "S"
				@direction = "E"
			when "E"
				@direction = "N"
			end
		elsif @instruction == "R"
			case @direction
			when "N"
				@direction = "E"
			when "E"
				@direction = "S"
			when "S"
				@direction = "W"
			when "W"
				@direction = "N"
			end
		end
	end
end

class Plateau
	attr_accessor :x, :y

	def initialize(x,y)
		@x = x
		@y = y
	end
end



def rover_mission

	# puts "Enter the plateau's coordinates separated by spaces (ie. 3 3): "
	# plateau_coordinates = gets.chomp
	# plateau_coordinates_arr = plateau_coordinates.split.map { |element| element.to_i }
	# print plateau_coordinates_arr

	# puts "Enter the rover's initial position and heading"
	# rover_initial_state = gets.chomp
	# rover_initial_state_arr = rover_initial_state.split
	# rover_initial_coords_arr = 
	# print rover_initial_state_arr

	puts "Enter a series of instructions for the rover to execute (ie. L, R or M): "
	rover_instructions = gets.chomp
	rover_instructions_arr = rover_instructions.upcase.split("")
	print rover_instructions_arr

	mars_sea = Plateau.new(5,5) # define grid size

	curiosity = Rover.new(0,0,"N") # create initial rover position and heading

	number_instructions = rover_instructions_arr.length

	index = 0
	number_instructions.times do 
		curiosity.read_instruction(rover_instructions_arr[index])
		curiosity.move
		curiosity.turn
		index += 1
	end
	puts curiosity
end

rover_mission





