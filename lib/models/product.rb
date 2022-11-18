require './lib/constants_v1.rb'
class Product
    def initialize(quantity, name, price, imported)
        @quantity = quantity
        @name = name
        @price = price
        @imported = imported
        calculate_tax
    end
    
    def calculate_tax
        verify_within_list_product
        basic =  @is_basic_taxeable ? BASIC_TAX : TAX_FREE_VALUE
        imported = @imported ? IMPORT_TAX : TAX_FREE_VALUE
        set_basic_tax(basic) 
        set_imported_tax(imported) 
        
        begin 
            return result_tax_amout
        rescue Exception => error
            return error
        end
        
    end

    def total_taxes
        @quantity * (tax_value)
    end

        
    private

    def verify_within_list_product
        $list_of_products.each do |category, products|
            if  (products & @name.split(' ')).size > 0
                @is_basic_taxeable = !BASIC_TAX_FREE_PRODUCTS.include?(category)
                break 
            end
        end
    end

    def set_basic_tax(basic_tax = BASIC_TAX)
        @basic_tax = basic_tax 
    end

    def set_imported_tax(imported_tax = IMPORT_TAX)
        @imported_tax  = imported_tax 
    end

    def accuracy
        WHOLE_VALUE / PRECISION
    end

    def round_tax_rule amount
        result_rounded_numerator = ((amount * accuracy).round/accuracy) 
        true_result = ((amount * accuracy)/accuracy) 
        if true_result > result_rounded_numerator
            result = result_rounded_numerator + PRECISION
        else
            result = result_rounded_numerator
        end
        return result.round(2)
    end

    def tax_value
        round_tax_rule(@price * ( @basic_tax + @imported_tax))
    end

end