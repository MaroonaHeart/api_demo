# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(
  [
    {
      name: 'PS4',
      brand: 'Sony',
      price: '$32.00 USD',
      description: 'Sony Gaming Console'
    },
    {
      name: 'Gallaxy Pro',
      brand: 'Samsung',
      price: '$700.00 USD',
      description: 'Samsung Gaming Console'
    },
    {
      name: 'MacBook 12',
      brand: 'Apple',
      price: '$409.00 USD',
      description: 'Apple Gaming Console'
    },
    {
      name: 'Printor',
      brand: 'Canon',
      price: '$5.00 USD',
      description: 'Canon Gaming Console'
    },
    {
      name: 'Magic Book',
      brand: 'Honor',
      price: '$21.00 USD',
      description: 'Honor Gaming Console'
    }
  ]
)
