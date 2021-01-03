
data_stream = File.readlines("day9_input.txt", chomp: true).map(&:to_i)

p data_stream

class DataPort
  attr_accessor :data_stream, :preamble_length

  def initialize(data_stream, preamble_length)
    @data_stream = data_stream
    @preamble_length = preamble_length
    @preamble = data_stream[0, preamble_length]
  end

  def find_invalid
    i = @preamble_length
    while i < @data_stream.length
      bunch = @data_stream[i-25, i]
      number = @data_stream[i]
      if !number_valid?(number, bunch)
        return @data_stream[i]
        break
      end
      i = i + 1
    end
  end

  def number_valid?(number, bunch)
    bunch.combination(2).to_a.map(&:sum).include?(number)
  end

  def find_invalid_2
    invalid, _ = @data_stream.find.with_index do |sum, i|
      next if i < @preamble_length
      @data_stream[i-@preamble_length, @preamble_length].
        combination(2).none? {|pair| pair.sum == sum}
    end
    return invalid
  end

  def find_sum(target)
    @data_stream.length.times do |i|
      j = i + 1
      while true
        range = @data_stream[]
      end
    end
  end

end

ds = DataPort.new(data_stream, 25)

p ds

p ds.find_invalid_2



