require "factory_girl_rails"

Factory.define :institution do |institution|
  institution.name      "Primarie"
  institution.address   "Piata Mare, nr. 1"
  institution.rating    4
  institution.rate_count 2
  institution.association :category
end

Factory.define :category do |category|
    category.name     "Administratie"
end

Factory.define :location do |location|
  location.name       "Sibiu"
  location.type       1
end