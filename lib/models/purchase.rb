require_relative 'product'
require './lib/helpers/sanitize_order_helper'
require './lib/constants_v1'
class Purchase 
    include SanitizeOrderHelper
    attr_accessor :products

    def initialize(file, product_generator = Product)
        @file = file
        @generator = product_generator
        @products = []
        @total, @total_taxes = ZERO_FLOAT, ZERO_FLOAT
        process
    end 

    def process
        load_file(@file)
    end

    def purchase_stdout
        @products.each do |order|
            order.order_stdout
            @total+= order.total_order_amout
            @total_taxes+= order.total_taxes
        end
        p @total, @total_taxes
    end

    private
    
    def load_file file
        File.foreach(file) do |order| 
            quantity = get_quantity order
            price = get_price order
            is_imported = is_imported? order
            name = get_product_name(order)
            @products << @generator.new(quantity, name, price, is_imported)
        end
    end

end