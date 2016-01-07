class RankingController < ApplicationController
  def have
    @havescounts = Have.limit(10).group(:item_id).count
  end  

  def want
    @wantscounts = Want.limit(10).group(:item_id).count
  end
end
