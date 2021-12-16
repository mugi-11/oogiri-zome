class HomesController < ApplicationController
  def top
    @themes = Theme.all
  end

  def about
  end
end
