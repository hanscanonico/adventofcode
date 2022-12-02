
file = File.open("day2_file.txt")
file_data = file.readlines
file_data.map do |k|
    k.gsub!("A", "1")
    k.gsub!("B", "2")
    k.gsub!("C", "3")
    k.gsub!("X", "1")
    k.gsub!("Y", "2")
    k.gsub!("Z", "3")
end
def find_player2_shape(player1, condition)
    if condition == 1
        if player1 == 1
            return 3
        elsif player1 == 2
            return 1
        elsif player1 == 3
            return 2
        end
    elsif condition == 2
        return player1
    elsif condition == 3
        if player1 == 1
            return 2
        elsif player1 == 2
            return 3
        elsif player1 == 3
            return 1
        end
    end
end

total_score = 0
total_score2 = 0

file_data.each do |k|
    score = 0
    values = k.split(" ")
    player1 = values[0].to_i
    player2 = values[1].to_i
    player2 = find_player2_shape(player1,player2)
    res = player1 - player2
    if res == -2
        score = 0 + player2
    elsif res == -1
        score = 6 + player2
    elsif res == 0
        score = 3 + player2
    elsif res == 1
        score = player2
    elsif res == 2
        score = 6 + player2
    end
    total_score += score
end

puts total_score