require_relative 'bingo'

lines = File.readlines("input.txt")
cards = Array.new
bingo_numbers = lines[0].split(",").map(&:to_i)

lines.select! { |line| line.length != "\n" }
(1..lines.length).step(6).each do |index|
  break if lines[index].nil?
  card_numbers = lines[index+1..index+5].join(" ").split(" ").map(&:to_i)
  cards.append(BingoCard.new(card_numbers))
end

bingo_numbers.each do |number|
  cards.each do |card|
    card.mark_number(number)
    if card.is_winner
      puts "Winner!!!"
      total = 0
      card.numbers.select { |unmarked_number| !unmarked_number.is_marked }.each do |unmarked_number|
        total += unmarked_number.value
      end

      pp total * number

      return
    end
  end
end
