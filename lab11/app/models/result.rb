class Result < ApplicationRecord
    validates:input ,uniqueness: true

    class<<self
        def generate_result(n, sequence)
            
            if are_equal? sequence, n
                if exists?(input:sequence)
                    res = eval(find_by(input: sequence).output)
                else
                    res = replace_not_sqr(sequence).slice_before("ex").to_a.each {|seq| seq.reject! { |item| item == "ex"}}.reject! {|s| s.length < 2}
                    create(input: sequence, output: res.to_s)
                end
            else
                res = nil
            end
            res
        end

        private 
        def are_equal? numbers, n
            if numbers.split.all? { |elem| elem.scan(/\D/).empty? } && n.split.all? { |elem| elem.scan(/\D/).empty? }
                n.split.map { |x| Integer(x) }.length == 1 && n.split.map { |x| Integer(x) }[0] == numbers.split.map { |x| Integer(x) }.length
            else
                false
            end 
        end

        def replace_not_sqr numbers
            sequence = numbers.split.map { |x| Integer (x) }
            sequence.each_with_index do |seq, i|
                unless is_sqrt? seq
                    sequence[i]="ex"
                end
            end
            sequence
        end

        def is_sqrt? num
            Math.sqrt(num).modulo(Math.sqrt(num).to_i) == 0
        end

    end
end