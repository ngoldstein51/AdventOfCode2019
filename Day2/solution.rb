file = File.open("input.txt").read
file = file.split(",").map { |i| i.to_i}

def runprog(noun,verb,file)
    file[1] = noun
    file[2] = verb

    pointer = 0

    while file[pointer] != 99
        if file[pointer] == 1
            file[file[pointer+3]] = file[file[pointer+1]] + file[file[pointer+2]]
        elsif file[pointer] == 2
            file[file[pointer+3]] = file[file[pointer+1]] * file[file[pointer+2]]
        end
        pointer += 4
    end

    return file[0]
end

noun = 0
verb = 0

while runprog(noun, verb, file.dup) != 19690720
    if noun == 99
        noun = -1
        verb += 1
    end
    noun += 1
end

puts((100 * noun) + verb)