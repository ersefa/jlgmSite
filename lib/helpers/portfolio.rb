module PortfolioHelper

  def portfoliosES
    @items.select { |item| item[:kind] == 'portfolioES' }
  end
 
  def portfoliosEN
    @items.select { |item| item[:kind] == 'portfolioEN' }
  end

  def sorted_portfoliosES
    portfoliosES.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end

  def sorted_portfoliosEN
    portfoliosEN.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end	

  def portfolio_image_url(item, type)
    '/images/portfolio/' + item[:image_id] + '_' + type + '.jpg'
  end
end
