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
				@y += 1
			when "S"
				@y -= 1
			when "E"
				@x += 1
			when "W"
				@x -= 1
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


class RoverMission
	attr_accessor :name
	@@count = 0
	@@location_info = []
	@@indexed_rovers = []

	def initialize(name)
		@name = name
		@@count += 1
	end

	def self.rover_count
		@@count
	end

	def self.mission_control
		puts "Currently there are #{@@count} active rovers"
		puts "They are located at: "
		puts @@location_info
	end

	def set_plateau(x,y)
		plateau = Plateau.new(x,y)
	end

	def place_rover(x,y,direction)
		@initial_state_arr = [x,y,direction]
		print @initial_state_arr
		@rover = Rover.new(@initial_state_arr[0],@initial_state_arr[1],@initial_state_arr[2])
		@@indexed_rovers << @name
		@@location_info << "#{@name}: (#{@rover.x}, #{@rover.y}) facing #{@rover.direction}"
	end

	def instruct_rover
		puts "Enter a series of instructions for #{@name} to execute (ie. L, R or M): "
		@instructions = gets.chomp
		@instructions_arr = @instructions.upcase.split("").compact
		print @instructions_arr
		@number_instructions = @instructions_arr.length
	end

	def execute_instructions
		index = 0
		@number_instructions.times do 
			@rover.read_instruction(@instructions_arr[index])
			@rover.move
			@rover.turn
			index += 1
		end
		puts @rover
		@@location_info[@@indexed_rovers.find_index(@name)] = "#{@name}: (#{@rover.x}, #{@rover.y}) facing #{@rover.direction}"
	end
end




#Create new mission
discovery = RoverMission.new("Discovery")
puts discovery.name
discovery.set_plateau(2,3)
discovery.place_rover(2,2,"N")
#Create new mission
curiosity = RoverMission.new("Curiosity")
puts curiosity.name
curiosity.set_plateau(2,3)
curiosity.place_rover(1,1,"E")
#Check status of the missions
puts RoverMission.rover_count
puts RoverMission.mission_control
#Move the Curiosity rover
curiosity.instruct_rover
curiosity.execute_instructions
#Move the discovery rover
discovery.instruct_rover
discovery.execute_instructions
#Check status of the missions
puts RoverMission.mission_control






