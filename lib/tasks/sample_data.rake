require "faker"

def make_institutions
  15000.times do |n|
    name = Faker::Name.name
    address = "#{Faker::Address.city}, #{Faker::Address.street_address(true)}"
    Institution.create!(:name => name,
                        :address => address)
  end
end

namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_institutions()
  end
end
