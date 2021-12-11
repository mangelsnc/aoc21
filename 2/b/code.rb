input_data = File.read("input.txt").split("\n")

status = { :depth => 0, :forward => 0, :aim => 0 }

puts input_data
for instruction in input_data do
    command, value = instruction.split
    value = value.to_i

    if command == :forward.to_s
      status[:forward] += value
      status[:depth] += (value * status[:aim])
    else
      if command == "up"
        value *= -1
      end
      status[:aim] += value
    end
end

puts status
puts status[:depth] * status[:forward]
