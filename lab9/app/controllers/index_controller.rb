class IndexController < ApplicationController
  def input
    render layout: false
  end

  def output
    if are_equal? params[:sequence], params[:n]
      @result = replace_not_sqr(params[:sequence]).slice_before("ex").to_a.each {|seq| seq.reject! { |item| item == "ex"}}.reject! {|s| s.length < 2}
    else
      @result = 'Error. You did not complete the field. Or inconsistency in the amount of data'
    end
      respond_to do |format|
        format.html 
        format.json do
        render json:
        {type: @result.class.to_s, value: @result}
        end
      end
  end

  private 
  def are_equal? numbers, n
    if n.split.map { |x| Integer(x) } && numbers.split.map { |x| Integer(x) }
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