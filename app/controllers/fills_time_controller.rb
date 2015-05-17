class FillsTimeController < ApplicationController
  def index
  end

  def calculate
    @sel_year = params[:sel_year].to_i
    @sel_month = params[:sel_month].to_i
    render :action => :result
  end

  def jan
  end
  def feb
  end
  def mar
  end
  def apr
  end
  def may
  end
  def jun
  end
end
