input_data = File.read("input.txt").split.map(&:to_i)

previous = input_data[0]
increments = 0

windows = (input_data.length - 4)

for window in (0..windows)
    current_window = input_data[(window..window + 2)].sum
    next_window = input_data[(window + 1..window + 3)].sum

    if next_window > current_window
        increments = increments + 1
    end
end

puts increments
