class VisitsController < ApplicationController
  def create
    link = Link.find_by(slug: params[:slug])
    if link
      visit = Visit.new(
        link_id: link.id,
        ip_address: request.remote_ip
      )
      visit.save
      redirect_to "#{link.target_url}"
    else
      raise ActionController::RoutingError.new('Not Found, Dingus')
    end
  end
end
