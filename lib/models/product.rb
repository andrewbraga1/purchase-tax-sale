class Product
    def round_tax_rule amount 
        ((amount * 1/0.05).round/(1/0.05))
    end
end