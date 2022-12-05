file = File.open("file.txt")
file_data = file.readlines
total_score = 0

stacks = {
    '1' => ['N','W','B'],
    '2' => ['B','M','D','T','P','S','Z','L'],
    '3' => ['R','W','Z','H','Q'],
    '4' => ['R','Z','J','V','D','W'],
    '5' => ['B','M','H','S'],
    '6' => ['B','P','V','H','J','N','G','L'],
    '7' => ['S','L','D','H','F','Z','Q','J'],
    '8' => ['B','Q','G','J','F','S','W'],
    '9' => ['J','D','C','S','M','W','Z'],
}
file_data.each do |line|
    index = 0
    line = line[4..-1]
    split_line = line.split("from")
    nb_of_stacks = split_line.first.to_i
    from_stack = split_line.last.split("to").first.to_i
    destination_stack = split_line.last.split("to").last.to_i
    stack_to_insert = []
    while index < nb_of_stacks do
        card = stacks[from_stack.to_s].first
        stack_to_insert << card
        stacks[from_stack.to_s].shift
        index+=1
    end

    stacks[destination_stack.to_s]= (stack_to_insert + stacks[destination_stack.to_s]).flatten
end

puts stacks

puts stacks.each{ |index, array| puts "#{index} #{array.first}" }  