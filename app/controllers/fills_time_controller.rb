class FillsTimeController < ApplicationController
  def index

  end

  def calculate

    @sel_year = params[:sel_year].to_i
    @sel_month = params[:sel_month].to_i
    @email = params[:email]

    email = @email
    year = @sel_year
    month = @sel_month

    ndays = Time.days_in_month(month, year)

    render :action => :result, locals: { year: year, month: month, email: email, ndays: ndays }
  end

end
