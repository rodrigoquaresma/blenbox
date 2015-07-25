class BbqController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
  end
  def calculate

    wgt_each_men = 0.7
    wgt_each_women = 0.5
    wgt_each_kids = 0.5

    qtd_men = 10
    qtd_women = 5
    qtd_kids = 2

    val_bovine = 0.6
    val_swine = 0.2
    val_chicken = 0.2

    qtd_cut_bovine = 4
    qtd_cut_swine = 3
    qtd_cut_chicken = 2

    wgt_meats = (wgt_each_men*qtd_men)+(wgt_each_women*qtd_women)+(wgt_each_kids*qtd_kids)

    @wgt_bovine = wgt_meats*val_bovine
    @wgt_swine = wgt_meats*val_swine
    @wgt_chicken = wgt_meats*val_chicken

    @wgt_each_cut_bovine = @wgt_bovine/qtd_cut_bovine
    @wgt_each_cut_swine = @wgt_swine/qtd_cut_swine
    @wgt_each_cut_chicken = @wgt_chicken/qtd_cut_chicken

    render :action => :result
  end

end
