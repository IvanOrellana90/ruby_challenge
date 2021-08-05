class Product

    def initialize(code, price, pack = false, pack_quantity = 0, pack_price = 0)
        @code = code
        @price = price
        @pack = pack
        @pack_quantity = pack_quantity
        @pack_price = pack_price
    end

    attr_accessor :code, :price, :pack, :pack_quantity, :pack_price

    def print()
        puts Code: + @code
        puts Price: + @price
        if @pack
            puts Pack: + @pack_quantity
            puts Price: + @pack_price
        end
    end
end