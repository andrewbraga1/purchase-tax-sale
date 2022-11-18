require './lib/constants_v1.rb'
class Product
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
end