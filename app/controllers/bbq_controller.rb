class BbqController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
  end
  def calculate

    val_men = 0.7
    val_women = 0.5
    val_kids = 0.5

    qtd_men = 1
    qtd_women = 1
    qtd_kids = 1

    val_bovine = 0.6
    val_swine = 0.2
    val_chicken = 0.2

    qtd_meats = (val_men*qtd_men)+(val_women*qtd_women)+(val_kids*qtd_kids)

    qtd_bovine = qtd_meats*val_bovine
    qtd_swine = qtd_meats*val_swine
    qtd_chicken = qtd_meats*val_chicken

    @show_me = quantif(qtd_bovine),quantif(qtd_swine),quantif(qtd_chicken)

    render :action => :result
  end

  def quantif(x)
    if x < 1
      x = "#{(x*1000).round(0)} gramas"
    else
      x = "#{number_with_precision(x, precision: 3)} kilos"
    end
  end

end
