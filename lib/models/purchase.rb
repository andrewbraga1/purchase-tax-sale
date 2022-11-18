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

    def process
        load_file(@file)
    end

    private
    
    def load_file file
        File.foreach(file) do |order| 
           # receive file data which every line it is an order(items purchase)
           # create helper for 'sanitization'
        end
    end
 
end