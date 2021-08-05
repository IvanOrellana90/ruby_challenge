require_relative "product.rb"

class Terminal

    def initialize
        @shopping_list = Hash.new
        @product_list = []
    end

    attr_accessor :shopping_list, :product_list

    def loadProductList()
        @product_list.push(Product.new("A", 2.00, true, 4, 7.00))
        @product_list.push(Product.new("B", 12.00))
        @product_list.push(Product.new("C", 1.25, true, 6, 6.00))
        @product_list.push(Product.new("D", 0.15))
    end

    # scan a product and add it to the shopping list
    def scan(code)
        for product in @product_list do
            # check the product code in the list (if exist)
            if product.code() == code
                # if is null add the product to the shopping list
                if @shopping_list[code].nil?
                    @shopping_list[code] = 1
                # if is not null increment the product to the shopping list
                else
                    @shopping_list[code] += 1
                end
            end
        end
    end

    # calculate the total amount of the shopping list
    def total()
        total_price = 0
        # 
        @shopping_list.each do |code, quantity|
            for product in @product_list do
                if product.code() == code
                    # check if exist a pack promotion for this product
                    if product.pack()
                        # get the total amount of packs in the shopping list and is multiplied for the pack price
                        total_price = total_price + (quantity / product.pack_quantity()).truncate() * product.pack_price()
                        # get the total amount per unit discounting the packs and is multiplied for the regular price
                        total_price = total_price + (quantity % product.pack_quantity() * product.price())
                    else
                        # get the total amount of units and multiplied for the regular price
                        total_price = total_price + (quantity * product.price())
                    end
                end
            end
        end
        puts "Total price: " + total_price.to_s
        # reset shopping list
        @shopping_list = Hash.new
    end

end