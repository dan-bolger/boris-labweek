require 'docking_station'

feature 'member of public accesses bike' do

  scenario 'docking station releases working bike' do
    docking_station = DockingStation.new
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  scenario 'docking station does not release a bike when there are none available' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error 'No bikes!'
  end

  scenario 'docking station does not release broken bikes' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    docking_station.dock bike
    expect { docking_station.release_bike }.to raise_error 'No bikes!'
  end
end

feature 'member of the public returns bike' do

  scenario 'bike cannot be docked when station is full' do
    docking_station = DockingStation.new
    docking_station.capacity.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Docking station full!'
  end


  scenario 'bike can be reported broken when returned' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    expect(bike).to be_broken
    expect { docking_station.dock bike }.not_to raise_error
  end
end

