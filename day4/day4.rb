file = File.open("file.txt")
file_data = file.readlines

def find_if_block_contained_in_other_block(block1, block2)
    return block1.split("-").first.to_i >= block2.split("-").first.to_i && block1.split("-").last.to_i <= block2.split("-").last.to_i
end

def find_if_block_overlap_with_other_block(block1, block2)
    range_block_1 = block1.split("-").first.to_i..block1.split("-").last.to_i
    range_block_2 = block2.split("-").first.to_i..block2.split("-").last.to_i
    return range_block_1.cover?(range_block_2.first) || range_block_2.cover?(range_block_1.first)
end

total_score = 0
file_data.each do |line|
    score = 0
    blocks = line.split(",")
    first_block = line.split(",").first
    second_block = line.split(",").last
    if find_if_block_overlap_with_other_block(first_block, second_block)
        score += 1
    elsif find_if_block_overlap_with_other_block(second_block, first_block)
        score += 1
    end
    total_score += score
end
puts total_score