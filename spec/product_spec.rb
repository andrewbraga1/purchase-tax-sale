require './lib/models/product'
describe Product do

    def test_initialize_product 
       @product = Product.new
    end

    describe "round tax rules" do
        #case over
        context "given '7.125'" do
          it "returns 7.15" do
            test_initialize_product
            expect(@product.round_tax_rule(7.125)).to eql(7.15)
          end
        end
        #case equal
        context "given '0.50'" do
          it "returns 0.50" do
            test_initialize_product
            expect(@product.round_tax_rule(0.50)).to eql(0.50)
          end
        end
        #case upper
        context "given '0.5625'" do
            it "returns 0.60" do
                test_initialize_product
                expect(@product.round_tax_rule(0.5625)).to eql(0.60)
            end
        end
        #case lower
        context "given '0.4462'" do
            it "returns 0.45" do
                test_initialize_product
                expect(@product.round_tax_rule(0.4462)).to eql(0.45)
            end
        end
      end
end