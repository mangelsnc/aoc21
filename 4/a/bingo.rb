class BingoNumber
  def initialize (number)
    @number = number
    @marked = false
  end

  def is_marked
    @marked
  end

  def value
    @number
  end

  def mark
    @marked = true
  end
end

class BingoCard
  ROW_LENGTH = 5
  COLUMN_LENGTH = 5

  def initialize(numbers)
    @numbers = Array.new

    numbers.each_with_index do |number|
      @numbers.append(BingoNumber.new(number))
    end
  end

  def numbers
    @numbers
  end

  def rows
    rows = Array.new
    row = Array.new

    @numbers.each_with_index do |number, index|
      if index % ROW_LENGTH == 0
        rows.append(row)
        row = Array.new
      end

      row.append(number)
    end

    rows
  end

  def columns
    columns = Array.new

    (0...COLUMN_LENGTH).each do |column_index|
      column = Array.new
      (0...ROW_LENGTH).each do |row_index|
        column.append(@numbers[column_index + (row_index * 5)])
      end
      columns.append(column)
    end

    columns
  end

  def mark_number(number_to_mark)
    number = @numbers.select { |number| number.value == number_to_mark }

    if number.length == 1
      number[0].mark
    end
  end

  def is_winner
    columns.each do |column|
      marked_numbers = column.select { |number| number.is_marked }

      if marked_numbers.length == COLUMN_LENGTH
        return true
      end
    end

    rows.each do |row|
      marked_numbers = row.select { |number| number.is_marked }

      if marked_numbers.length == ROW_LENGTH
        return true
      end
    end

    false
  end
end
