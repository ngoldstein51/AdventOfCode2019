file = File.open("input.txt").read
file = file.split("\n")

wire_one = file[0].split(',')
wire_two = file[1].split(',')

curr = [0,0]

path = {}

one_steps = 0

wire_one.each do |i|
    dir = i[0]
    i[0] = ''
    #puts(curr[0].to_s + ',' +curr[1].to_s)
    if dir == 'R'
        (1..(i.to_i)).each do |n|
            curr[0] += 1
            one_steps += 1
            path[curr[0].to_s + ',' + curr[1].to_s] = one_steps
        end
    elsif dir == 'U'
        (1..(i.to_i)).each do |n|
            curr[1] += 1
            one_steps += 1
            path[curr[0].to_s + ',' + curr[1].to_s] = one_steps
        end
    elsif dir == 'L'
        (1..(i.to_i)).each do |n|
            curr[0] -= 1
            one_steps += 1
            path[curr[0].to_s + ',' + curr[1].to_s] = one_steps
        end
    elsif dir == 'D'
        (1..(i.to_i)).each do |n|
            curr[1] -= 1
            one_steps += 1
            path[curr[0].to_s + ',' + curr[1].to_s] = one_steps
        end
    end
end

intersection_points = []
curr = [0,0]

two_steps = 0

wire_two.each do |i|
    dir = i[0]
    i[0] = ''
    if dir == 'R'
        (1..(i.to_i)).each do |n|
            curr[0] += 1
            two_steps += 1
            if path[curr[0].to_s + ',' + curr[1].to_s]
                #intersection_points << curr.dup
                intersection_points << path[curr[0].to_s + ',' + curr[1].to_s] + two_steps
            end
        end
    elsif dir == 'U'
        (1..(i.to_i)).each do |n|
            curr[1] += 1
            two_steps += 1
            if path[curr[0].to_s + ',' + curr[1].to_s]
                #intersection_points << curr.dup
                intersection_points << path[curr[0].to_s + ',' + curr[1].to_s] + two_steps
            end
        end
    elsif dir == 'L'
        (1..(i.to_i)).each do |n|
            curr[0] -= 1
            two_steps += 1
            if path[curr[0].to_s + ',' + curr[1].to_s]
                #intersection_points << curr.dup
                intersection_points << path[curr[0].to_s + ',' + curr[1].to_s] + two_steps
            end
        end
    elsif dir == 'D'
        (1..(i.to_i)).each do |n|
            curr[1] -= 1
            two_steps += 1
            if path[curr[0].to_s + ',' + curr[1].to_s]
                #intersection_points << curr.dup
                intersection_points << path[curr[0].to_s + ',' + curr[1].to_s] + two_steps
            end
        end
    end
end

# puts(one_steps)
# puts(two_steps)

#intersection_points = intersection_points.map{ |i| i[0].abs + i[1].abs }

puts(intersection_points.min())
    