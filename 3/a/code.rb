input_data = File.read("input.txt").split("\n")

most_common = []
least_common = []

zeroes = Array.new(12, 0)
ones = Array.new(12, 0)

input_data.each { |binary|
  digits = binary.split('')

  digits.each_with_index { |digit, index|
    if digit.to_i == 0
      zeroes[index] = zeroes[index] + 1
    else
      ones[index] = ones[index] + 1
    end
  }
}

(0..11).each { |index|
  if zeroes[index] > ones[index]
    most_common[index] = 0
    least_common[index] = 1
  else
    most_common[index] = 1
    least_common[index] = 0
  end
}

gamma_rate = most_common.join.to_i(2)
epsilon_rate = least_common.join.to_i(2)

power_consumption = gamma_rate * epsilon_rate

pp power_consumption
