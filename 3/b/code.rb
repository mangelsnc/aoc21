input_data = File.read("input.txt").split("\n")

def get_most_common(input_data)
  most_common = []

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
    if zeroes[index] == ones[index]
      most_common[index] = 2
    elsif zeroes[index] > ones[index]
      most_common[index] = 0
    else
      most_common[index] = 1
    end
  }

  most_common
end

def get_least_common(input_data)
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
    if zeroes[index] == ones[index]
      least_common[index] = 2
    elsif zeroes[index] > ones[index]
      least_common[index] = 1
    else
      least_common[index] = 0
    end
  }

  least_common
end

filtered_data = input_data
(0...12).each do |index|
  break if filtered_data.length == 1
  most_common = get_most_common(filtered_data)

  filtered_data = filtered_data.select { |binary|
    (most_common[index] == 2 and binary[index].to_i == 1) or binary[index].to_i == most_common[index]
  }

end
pp "Oxygen Generator Rating: #{filtered_data[0].to_i(2)}"

filtered_data = input_data
(0...12).each do |index|
  break if filtered_data.length == 1
  least_common = get_least_common(filtered_data)

  filtered_data = filtered_data.select { |binary|
    (least_common[index] == 2 and binary[index].to_i == 0) or binary[index].to_i == least_common[index]
  }

end
pp "C02 Scrubber Rating: #{filtered_data[0].to_i(2)}"
