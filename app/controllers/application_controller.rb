class ApplicationController < ActionController::Base
    skip_before_action :authenticate_tenant!, :only => "reply", :raise => false
end
