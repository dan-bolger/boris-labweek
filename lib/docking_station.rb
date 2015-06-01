require_relative 'bike'

class DockingStation

  def dock(bike)
    fail 'Docking station full!' if @bike
    @bike = bike
  end

  def release_bike
    fail 'No bikes!' unless @bike
    @bike
  end

end