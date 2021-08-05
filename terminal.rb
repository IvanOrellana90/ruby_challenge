require_relative "product.rb"

class Terminal

    def initialize
        @shopping_list = {}
        @product_list = []
    end

    attr_accessor :shopping_list, :product_list

    def loadProductList()
        @product_list.push(Product.new("A", 2.00, true, 4, 7.00))
        @product_list.push(Product.new("B", 12.00))
        @product_list.push(Product.new("C", 1.25, true, 6, 6.00))
        @product_list.push(Product.new("D", 0.15))
    end

    def scan(code)
        for product in @product_list do
            if product.code() == code
                if @shopping_list[code].nil?
                    @shopping_list[code] = 1
                else
                    @shopping_list[code] += 1
                end
            end
        end
    end

end