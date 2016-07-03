require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|

  # Print the name of the toy
  puts "#{toy["title"]}"

  # Print the retail price of the toy
  retail_Price = toy["full-price"]
  puts "$#{retail_Price}"
  
  # Calculate and print the total number of purchases
  num_Purchased = toy["purchases"].length
  puts "#{num_Purchased}"
  
  # Calculate and print the total amount of sales
  total_price = toy["purchases"].inject(0) do |sum, purchase|
    sum + purchase["price"]
  end
  puts "$#{total_price}"
  
  # Calculate and print the average price the toy sold for
  average_price = total_price/num_Purchased
  puts "$#{average_price}"
  
  # Calculate and print the average discount (% or $) based off the average sales price
  discount = retail_Price.to_f  - average_price
  puts "$#{discount.round(2)}"
  
end

  

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

  #Get the specific brands
  brands =  products_hash["items"].map { |item| item["brand"]}.uniq
  
# For each brand in the data set:
  brands.each do |brand| 
    
    puts "Brand #{brand}"
    
    brand_toys = products_hash["items"].select { |toy| toy["brand"] == brand}
    
    # Count and print the number of the brand's toys we stock
    stock = 0
    brand_toys.each do |toy|
      stock += toy["stock"].to_i
    end
    puts stock
    
    toy_price = 0.0
    # Calculate and print the average price of the brand's toys
    brand_toys.each do |toy|
      toy_price += toy["full-price"].to_f
    end
    puts "#{(toy_price/stock).round(2)}"
    
    total_revenue = 0.0
    # Calculate and print the total revenue of all the brand's toy sales combined
    brand_toys.each do |toy|
      
      toy["purchases"].each do |purchase|
        total_revenue += purchase["price"].to_f
      end 
      
    end
    puts "$#{total_revenue.round(2)}"
    
  end