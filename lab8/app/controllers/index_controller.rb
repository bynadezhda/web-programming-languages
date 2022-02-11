class IndexController < ApplicationController
  def input
  end

  def output
    if are_equal? params[:sequence], params[:n]
      sequence = params[:sequence].split.map { |x| Integer(x) } 
      sequence.each_with_index do |seq, i|
        unless is_sqrt? seq
          sequence[i]="ex"
        end
      end
      @result = sequence.slice_before("ex").to_a.each {|seq| seq.reject! { |item| item == "ex"}}.reject! {|s| s.length < 2}
    else
      @error = 'Error. You did not complete the field. Or inconsistency in the amount of data'
    end
    rescue 
      @error = 'Invalid input'
  end

  private 
  def are_equal? numbers, n
    n.split.map { |x| Integer(x) }.length == 1 && n.split.map { |x| Integer(x) }[0] == numbers.split.map { |x| Integer(x) }.length
  end

  def is_sqrt? num
    Math.sqrt(num).modulo(Math.sqrt(num).to_i) == 0
  end
end