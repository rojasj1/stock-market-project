class HomeController < ApplicationController
  def index
    if params[:id] == ""
      @nothing = "Hey you forgot to enter a symbol"
    elsif
      
      if params[:id]
        begin
          @stock = StockQuote::Stock.quote(params[:id])
          rescue StandardError
          @error = "hmm something doesn't seem right try it one more time"
        end
  
      end
    end  
    
    
  end
  
  def about
  end

end

   ## @stock = StockQuote::Stock.quote("symbol")
