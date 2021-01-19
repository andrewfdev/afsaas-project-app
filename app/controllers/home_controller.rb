class HomeController < ApplicationController
  

  skip_before_action :authenticate_tenant!, :only => [ :index, :reply, :show],  :raise => false

  def index
    logger.debug("current_user - #{current_user.inspect}")
    logger.debug("current_tenant - #{current_user.tenants.first.inspect}")
    if current_user
      if session[:tenant_id]
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant(current_user.tenants.first)
        
      end
      @tenant = Tenant.current_tenant
      @projects = Project.by_plan_and_tenant(@tenant.id)
      params[:tenant_id] = @tenant.id
    end
  end
end
