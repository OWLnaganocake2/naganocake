class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
		order = OrderDetail.find(params[:id])
		order_details = order.order_details
    order.update(order_params)

		if order.status == "payment_comfirm"
			order_details.update_all(making_status: "waiting_for_production")
		end
		redirect_to admin_order_path(order.id)
	end


	def update
		order_detail = OrderDetail.find(params[:id])
		order_detail.update(order_detail_params)

		case order_detail.making_status
		 when "in_production"
				order_detail.order.update(status: "in_production")
		 when "production_completed"
			if order_detail.order.order_details.all?{|order_detail| order_detail.making_status == "production_completed"}
				order_detail.order.update(status: "preparing_for_shipment")
			end
		end
		redirect_to admin_order_path(order_detail.order.id)
	end

	private
   def order_detail_params
		 params.require(:order_detail).permit(:making_status)
	 end
end
