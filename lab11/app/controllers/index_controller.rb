class IndexController < ApplicationController
  def input
  end

  def cached
    result = Result.all.map{|var| [in: var.input, out: var.output] }
    p Result.all
    respond_to do|format|
      format.xml{render xml: result.to_xml}
    end
  end

  def output
    @result = Result.generate_result(params[:n], params[:sequence])
  end
end