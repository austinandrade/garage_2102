class Car
  attr_reader :info
  def initialize(info)
    @info = info
  end

  def make
    @info[:description].split[1]

  end

  def model
    @info[:description].split[2]
  end

  def color
    @info[:description].split[0]
  end

  def year
    @info[:year]

  end

  def age
    2021 - @info[:year].to_i
  end
end
