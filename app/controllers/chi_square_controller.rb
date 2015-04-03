class ChiSquareController < ApplicationController

  def index
    @result = ''
  end

  def calculate

    m = params[:number_group_a_v].to_i #total design a
    a = params[:number_group_a_g].to_i #pass design a
    n = params[:number_group_b_v].to_i #total design b
    c = params[:number_group_b_g].to_i #pass design b
    b = m.to_i - a.to_i
    d = n.to_i - c.to_i
    r = a.to_i + c.to_i
    s = b.to_i + d.to_i
    mn = m.to_i + n.to_i


    calc_1 = a*d-b*c
    calc_2 = calc_1*calc_1
    calc_3 = calc_2*mn
    calc_4 = m*n*r*s
    calc_5 = calc_3/calc_4


    @result = calc_5

    render :action => :index

  end

end
