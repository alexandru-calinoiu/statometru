require "faker"

def make_institutions
  Institution.delete_all
  30000.times do
    name = Faker::Name.name
    address = "#{Faker::Address.city}, #{Faker::Address.street_address(true)}"
    Institution.create!(:name => name,
                        :address => address,
                        :location => Location.find_by_id(rand(10000) + 1),
                        :category => Category.find_by_id(rand(80) + 1))
  end
end

namespace :db do
  desc 'Fill database with sample data'
  task :populate_institutions => :environment do
    make_institutions()
  end
end
