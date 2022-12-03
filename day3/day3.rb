file = File.open("file.txt")
file_data = file.readlines

total_score = 0
file_data.each do |line|
    score = 0
    half = line.length / 2
    first_half = line[0..half-2]
    second_half = line[half-1..-1]
    search_chars = []
    first_half.each_char do |char|
        if second_half.include?(char) && !search_chars.include?(char)
            search_chars << char
            score += char.gsub(/[A-Z]/) {|m| m.ord - 38}.gsub(/[a-z]/) {|m| m.ord - 96}.to_i
        end
    end
    total_score += score
end

index = 3
total_score = 0
while index <= file_data.size do
    score = 0
    lines = file_data[index-3..index-1]
    line1 = lines[0].gsub(/[^0-9a-z ]/i, '').chars
    line2 = lines[1].gsub(/[^0-9a-z ]/i, '').chars
    line3 = lines[2].gsub(/[^0-9a-z ]/i, '').chars
    char = (line1 & line2 & line3).first
    score += char.gsub(/[A-Z]/) {|m| m.ord - 38}.gsub(/[a-z]/) {|m| m.ord - 96}.to_i
    index += 3
    total_score += score
end
puts "score total #{total_score}"