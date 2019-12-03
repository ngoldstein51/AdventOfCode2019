file = File.open("input.txt").read
file = file.split("\n")
total = 0

file.each do |i|
    fuel_val = i.to_i
    fuel_val = (fuel_val/3)-2
    while fuel_val > 0
        total += fuel_val
        fuel_val = (fuel_val/3)-2
    end
end

puts(total)
