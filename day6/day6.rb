file = File.open("file.txt")
file_data = file.readlines
value = 0
file_data.each do |line|
    index = 0
    while index < line.length do
        chars = line[index..index+13].split(//).tally
        if chars.length == 14
            value = index +1 + 13
            break
        end
        index+=1
    end
end  

puts "value #{value}"