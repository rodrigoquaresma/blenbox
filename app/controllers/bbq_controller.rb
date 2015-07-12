class BbqController < ApplicationController
  def index
  end
  def calculate
    render :action => :result
  end
end
