require_relative 'product'
require './lib/constants_v1'
class Purchase 
    attr_accessor :products

    def initialize(file, product_generator = Product)
        @file = file
        @generator = product_generator
        @products = []
        @total, @total_taxes = ZERO_FLOAT, ZERO_FLOAT
    end 
 
end