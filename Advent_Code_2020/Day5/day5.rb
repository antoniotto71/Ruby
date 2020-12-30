input = File.readlines("input.txt", chomp: true)

p input


def decode_seat(input)
  
  input_rows = input[0,7]
  input_columns = input[7,10]
  rows = *(0..127)
  input_rows.each_char do |c|
    if c == 'F'
      rows = rows[0, (rows.size / 2)]
    else
      rows = rows[rows.size / 2, (rows.size - 1)]
    end
  end
  row = rows[0]
  columns = *(0..7)
  input_columns.each_char do |c|
    if c == 'L'
      columns = columns[0, columns.size / 2]
    else
      columns = columns[columns.size / 2, (columns.size - 1)]
    end
  end
  column = columns[0]
  [row, column]
end

decoded_seats = input.map {|x| decode_seat(x)}

decoded_rows = decoded_seats.map {|x, _| x}

p decoded_seats

decoded_ids = input.map {|x| decode_seat(x).inject {|x, y | x * 8 +y} }

p decoded_ids.max


all_seats = []
(7..120).each do |row|
  (0..7).each do |column|
    all_seats << [row, column]
  end
end

p diff_seats  = all_seats - decoded_seats

p diff_ids = diff_seats.map {|x, y | x * 8 +y}

p diff_ids