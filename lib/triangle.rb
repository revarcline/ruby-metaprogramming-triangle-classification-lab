class Triangle
  attr_reader :one, :two, :three

  def initialize(one, two, three)
    @one = one
    @two = two
    @three = three
  end

  def valid?
    inequal = one + two > three && one + three > two && two + three > one
    lengths = one.positive? && two.positive? && three.positive?
    inequal && lengths
  end

  def kind
    raise TriangleError unless valid?

    if one == two && two == three
      :equilateral
    elsif one == three || two == three || one == two
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
