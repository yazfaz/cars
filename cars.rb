class Car
	@@total_car_count=0
	@@cars_by_color={}
	@@miles_driven={}

	attr_accessor :color, :distance, :fuel, :total_car_count, :name, :cars_by_color

	def self.total_car_count
		@@total_car_count
	end

	def self.cars_by_color
		@@cars_by_color
		 # @@cars_by_color.each {|k,v| puts "#{k} #{v}"}
	end

	def self.most_popular_color
		@@cars_by_color.each {|k,v| return k if v == @@cars_by_color.values.max}
	end

	def self.most_miles_driven
		# @@miles_driven=@distance
		@@miles_driven.each {|k,v| return k if v == @@miles_driven.values.max}
	end
	
	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color=nil, name=nil)
		@fuel = 10
		@distance = 0
		@@total_car_count+=1
		@name=name
		if @@cars_by_color[color] == nil
			@@cars_by_color[color]=1
		else
			@@cars_by_color[color]+=1
		end
		# if color doesnt exist in hash, set to 1; if it exists, counter will start
	end

def change_color(new_color, color)
	@@cars_by_color[color] -=1
		if @@cars_by_color[new_color] == nil
			@@cars_by_color[new_color]=1
		else
			@@cars_by_color[new_color]+=1
		end 
end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
		@@miles_driven[@name]=@distance
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
	
end

class Convertible < Car
	def initialize (color, name, roof_status=nil)
		super(color, name)
		@roofstatus= roof_status
	end

	def print_roof_status
		puts "I'm a convertible! My roof is #{@roof_status}."
	end
	
	def top_down
		if @roof_status == "closed"
			puts "Roof is going down."
			@roof_status = "down"
		else 
			puts "Roof is already down."
			@roof_status="down"
		end
	end

	def close_top
		if @roof_status== "down"
		puts "Roof is closing."
		@roof_status="closed"
		else
		puts "Roof is already closed."
		@roof_status="closed"
		end
	end
end

# c=Convertible.new('blue','Yasmin','closed')
# # c.close_top
# # c.print_roof_status
# # c.top_down
# puts c.drive(100)
# puts c.to_s()



# c=Car.new('red', 'Mike')
# puts Car.cars_by_color
# c2=Car.new('green', "Yasmin")

# puts Car.cars_by_color
# puts Car.total_car_count
# c.change_color('green', 'red')
# puts Car.most_popular_color
# best_color= Car.most_popular_color
# Car.new(best_color)
# # # cnew = Car.new(best_color)
# # # puts "My colors car is #{cnew.color}"
# c.drive(100)
# c2.drive(200)
# puts Car.most_miles_driven