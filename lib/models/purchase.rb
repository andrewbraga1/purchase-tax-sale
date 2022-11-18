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

    private
    
    def load_file file
        File.foreach(file) do |order| 
            quantity = get_quantity order
            price = get_price order
            is_imported = is_imported? order
            name = get_product_name(order)
            p quantity,name, price, is_imported 
        end
    end
 
end