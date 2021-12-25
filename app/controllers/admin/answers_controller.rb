class Admin::AnswersController < ApplicationController
  
  before_action :authenticate_admin!
end
