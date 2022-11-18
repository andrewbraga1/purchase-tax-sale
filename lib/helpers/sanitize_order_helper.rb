require './lib/constants_v1'
module SanitizeOrderHelper
   
    def get_quantity order
        order[INTEGER_REGEX].to_i
    end

    def get_product_name order
        order.gsub!(regex_parameters, '').strip.downcase
    end
    
    def is_imported? order
        (order[set_regex(IMPORTED)]) ? true : false
    end

    def get_price order
        order[FLOAT_REGEX].to_f
    end

    private

    def regex_parameters
        load_params=[FLOAT_REGEX, INTEGER_REGEX, BREAK_LINE_REGEX, PREPOSITION, IMPORTED].map(&:to_s)
        return set_regex(load_params.map { |x| x }.join('|'))
    end

    def set_regex input
        Regexp.new(input)
    end
end