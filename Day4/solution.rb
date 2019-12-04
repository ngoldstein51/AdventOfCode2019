file = File.open("input.txt").read
file = file.split("-")
file = file.map { |i| i.to_i }

def has_dup(num)
    n = num.dup
    n = n.to_s
    (0..n.size-2).each do |i|
        if n[i] == n[i+1] && n[i+1] != n[i+2] && (i > 0 ? (n[i-1] != n[i]) : true)
            return true
        end
    end
    return false
end

def is_increasing(num)
    n = num.dup
    n = n.to_s
    (0..n.size-2).each do |i|
        if n[i].to_i > n[i+1].to_i
            return false
        end
    end
    return true
end

valid_choices = 0

(file[0]..file[1]).each do |i|
    if has_dup(i) && is_increasing(i)
        valid_choices += 1
    end 
end

puts(valid_choices)