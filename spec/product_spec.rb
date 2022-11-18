require './lib/models/product'
describe Product do

    def test_initialize_product 
       @product = Product.new
    end

    describe "round tax rules" do
        context "given '7.125'" do
          it "returns 7.15" do
            test_initialize_product
            expect(@product.round_tax_rule(7.125)).to eql(7.15)
          end
        end
    
        context "given '0.50'" do
          it "returns 0.50" do
            test_initialize_product
            expect(@product.round_tax_rule(0.50)).to eql(0.50)
          end
        end
      end
end