class Product
    def accuracy
        1/0.05
    end

    def round_tax_rule amount 
        result_rounded_numerator = ((amount * accuracy).round/accuracy) 
        true_result = ((amount * accuracy)/accuracy) 
        if true_result > result_rounded_numerator
            result = result_rounded_numerator + 0.05
        else
            result = result_rounded_numerator
        end
        return result.round(2)
    end
end