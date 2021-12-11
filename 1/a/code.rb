input_data = File.read("input.txt").split.map(&:to_i)

previous = input_data[0]
increments = 0

for current in input_data.drop(1) do
    if current > previous
        increments = increments + 1
    end

    previous = current
end

puts increments
