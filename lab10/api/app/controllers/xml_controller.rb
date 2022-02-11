class XmlController < ApplicationController

  def index
    if are_equal? params[:sequence], params[:n]
      pre = replace_not_sqr(params[:sequence]).slice_before("ex").to_a.each {|seq| seq.reject! { |item| item == "ex"}}.reject! {|s| s.length < 2}
      @result = pre.map {|val| {iter: val.length, num: val.join(", ")}}
    else
      @result = {message: "Error. You did not complete the field. Or inconsistency in the amount of data. Or invalid input"}

    end

    respond_to do |format|
      format.html {render xml: @result.to_s}
      format.xml  {render xml: @result.to_xml}
      format.rss  {render xml: @result.to_xml}
    end
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
