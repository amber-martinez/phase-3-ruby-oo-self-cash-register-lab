require 'pry'

class CashRegister

    attr_accessor :discount, :total, :add_item, :items, :apply_discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total=(total)
        @total = total
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        self.itemCalc(title, price, quantity)
    end

    def apply_discount
        if discount > 0
            @total = @total - @total * discount / 100
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def itemCalc(item, price, quantity = 1)
        quantity.times do
            @items.push(item)  
        end
        return items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end

reg3 = CashRegister.new(20)
puts reg3.add_item("apple", 0.99)
puts reg3.add_item("tomato", 1.76)
puts reg3.items
puts reg3.total
puts "-------------"
puts reg3.void_last_transaction
puts "-------------"
puts reg3.total

