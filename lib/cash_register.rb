class CashRegister

	attr_accessor :discount, :total, :last_trxn, :items

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(item, price, quantity=1)
		@last_trxn = price
		quantity.times do
			@items << item
		end
		@total = @total + (price * quantity)
	end

	def apply_discount
		return "There is no discount to apply." if @discount == 0
		@total = @total - (@total * (@discount.to_f/100))
		"After the discount, the total comes to $#{@total.to_i}."
	end

	def void_last_transaction
		@total = @total - @last_trxn
	end
end