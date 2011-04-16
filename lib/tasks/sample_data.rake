require "faker"

def make_locations
  10.times do
    name = Faker::Address.city
    type = rand(4)
    Location.create!(:name => name, :type => type)
  end
end

def make_institutions
  99.times do
    name = Faker::Name.name
    address = "#{Faker::Address.city}, #{Faker::Address.street_address(true)}"
    Institution.create!(:name => name, :address => address, :location_id => rand(10))
  end
end

namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_locations()
    make_institutions()
  end
end
