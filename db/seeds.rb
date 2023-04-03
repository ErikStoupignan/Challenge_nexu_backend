
require 'json'

# Cleans the database when reloading the seed
Brand.destroy_all
Model.destroy_all

# Reads the models.json file with the challenge information 
# and translates it with the parse function
file = File.read('db\models.json')
models_data = JSON.parse(file)

models_data.each do |model_data|
  brand = Brand.find_or_create_by!(name: model_data['brand_name'])
  Model.create!(
    id: model_data['id'],
    name: model_data['name'],
    average_price: model_data['average_price'],
    brand:
  )
end