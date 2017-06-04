
class Rook
  MOVES = "_12345678"
  attr_accessor :coordinates_x, :coordinates_y

  def initialize(coordinates)
    @coordinates_x = coordinates[0]
    @coordinates_y = coordinates[1]
  end

  def to_s
    "#{view}"
  end

  private

  def posible
    cordx = Cord.new.cord_x.delete(@coordinates_x)
    cordy = Cord.new.cord_y.delete(@coordinates_y)
    [cordx,cordy]
  end

  def real_posible
    [
      posible[1].split('')[1..8].map {|a| "#{@coordinates_x}" + a },
      posible[0].split('')[1..8].map {|a|  a + "#{@coordinates_y}" }
    ]
  end

  def view
    real_posible.join(' ')
  end

  class Cord
    CORD_X = "_abcdefgh"
    CORD_Y = "_12345678"
    attr_writer :cord_x, :cord_y

    def inititialize(cord_x,cord_y)
      @cord_x = cord_x
      @cord_y = cord_y
    end

    def cord_x
      self.cord_x = CORD_X
    end

    def cord_y
      self.cord_y = CORD_Y
    end

  end
end

puts Rook.new('a1')
