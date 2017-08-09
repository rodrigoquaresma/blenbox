class BbqController < ApplicationController
  include ActionView::Helpers::NumberHelper
  # include ActionView::Helpers::BbqHelper
  include ActionView::Base::BbqHelper

  def index
  end
  def calculate

    # config | meat weight per kind of person
    wgt_each_men = 0.7
    wgt_each_women = 0.5
    wgt_each_kids = 0.4

    # form | person's quantity.
    qtd_men = params[:qtd_men].to_i - params[:qtd_men_veg].to_i
    qtd_women = 8
    qtd_kids = 6

    # form | meat's division. what's the distribution for each kind of meat
    val_bovine = 0.7
    val_swine = 0.2
    val_chicken = 0.1

    # form | cut's quantity. how many cuts per each kind of meat
    @qtd_cut_bovine = 4
    @qtd_cut_swine = 2
    @qtd_cut_chicken = 2

    # total meat
    wgt_meats = (wgt_each_men*qtd_men)+(wgt_each_women*qtd_women)+(wgt_each_kids*qtd_kids)

    # total per kind of meat
    @wgt_bovine = wgt_meats*val_bovine
    @wgt_swine = wgt_meats*val_swine
    @wgt_chicken = wgt_meats*val_chicken

    # weight per cut
    @wgt_each_cut_bovine = @wgt_bovine/@qtd_cut_bovine
    @wgt_each_cut_swine = @wgt_swine/@qtd_cut_swine
    @wgt_each_cut_chicken = @wgt_chicken/@qtd_cut_chicken

    xyz = 0

    meats.each do |xmeat|

      if xmeat[0] == 'bovina (boi)'
        wgt_meat_lim = @wgt_bovine
        wgt_each_cut = @wgt_each_cut_bovine
        qtd_cuts_lim = @qtd_cut_bovine
      elsif xmeat[0] == 'suína (porco)'
        wgt_meat_lim = @wgt_swine
        wgt_each_cut = @wgt_each_cut_swine
        qtd_cuts_lim = @qtd_cut_swine
      elsif xmeat[0] == 'aves (frango)'
        wgt_meat_lim = @wgt_chicken
        wgt_each_cut = @wgt_each_cut_chicken
        qtd_cuts_lim = @qtd_cut_chicken
      end

      i = 0

      xmeat[1].each do |xcut_meat|
        while i < qtd_cuts_lim  do
          xyz +=1
          i +=1
        end
      end

    end

    @showme = qtd_men

    render :action => :result
  end

end
