require 'json'
require './lib/models/purchase'
class PurchaseTaxSale
  
  def self.run ( purchase_generator = Purchase , file = nil, index_test = 3)
    @list_of_products_file = './docs/list_of_products.json'
    @input_file =  file || "./docs/input#{index_test}.txt"
    @generator = purchase_generator
  end
  
  run()

  begin 
      if @list_of_products_file and @input_file
          $list_of_products = JSON.load_file(@list_of_products_file)
          @purchase = @generator.new(@input_file)
          @purchase.purchase_stdout
      else
          raise 'No input file selected'
      end
  rescue Exception => error
      system "clear"
      print ">>> #{error} <<<\n\n"
  end
 
end