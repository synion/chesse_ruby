class Knight
  VECTORS = [
              [2, -1], [2, 1], [-2, -1], [-2, 1],
              [1, -2], [1, 2], [-1, -2], [-1, 2]
            ]
  attr_accessor :coordinates_x, :coordinates_y

  def initialize(coordinates)
    @coordinates_x = coordinates[0]
    @coordinates_y = coordinates[1]
  end

  def cord_x
    Cord.new.cord_x.index(@coordinates_x)
  end

  def cord_y
    Cord.new.cord_y.index(@coordinates_y.to_s)
  end


  def to_s
    "#{view}"
  end


private

  def view
    convert_position.join(' ')
  end

  def posible
    VECTORS.map{|x,y| [x + self.cord_x, y + self.cord_y]  }
  end

  def real_posible
    posible.select {|x,y| (1..8).include?(x) && (1..8).include?(y) }
  end

  def convert_position
    real_posible.map {|x,y| "#{Cord.new.cord_x[x]}#{Cord.new.cord_y[y]}"}.sort
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

puts Knight.new("g2")
