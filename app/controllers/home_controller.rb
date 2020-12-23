class HomeController < ApplicationController
  

  skip_before_action :authenticate_tenant!, :only => [ :index ],  :raise => false

  def index
  end
end
