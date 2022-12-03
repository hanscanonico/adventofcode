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

puts total_score