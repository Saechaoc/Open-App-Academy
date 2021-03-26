class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? {|val| POSSIBLE_PEGS.include?(val.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map {|peg| peg.upcase}
    else
      raise StandardError.new "Invalid PEGS"
    end
  end

  def self.random(length)
    newPegs = []
    (0...length).each do |val|
      newPegs.push(POSSIBLE_PEGS.keys.sample)
    end
    Code.new(newPegs)
  end

  def self.from_string(inputStr)
    inputArr = inputStr.split('')
    if Code.valid_pegs?(inputArr)
      return Code.new(inputArr)
    end
    return nil
  end

  def [](element)
    @pegs[element]
  end

  def length
    @pegs.count
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |val,idx|
      count+=1 if @pegs[idx].eql?(val)
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |val,idx|
      count+=1 if (!@pegs[idx].eql?(val) && pegs.include?(val))
    end
    count
  end

  def ==(otherCode)
    otherCode.pegs == self.pegs
  end
end