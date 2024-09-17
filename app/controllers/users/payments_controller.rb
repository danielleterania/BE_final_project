module Users
    class PaymentsController < ApplicationController
      before_action :authenticate_user!
  
      def index
        @year = Date.current.year
        @months = %w[January February March April May June July August September October November December]
        @payments = current_user.payments.where(year: @year)
      end
  
      def update
        @payment = current_user.payments.find(params[:id])
        if @payment.update(payment_params)
          redirect_to users_payments_path, notice: 'Payment status updated.'
        else
          render :index
        end
      end
  
      private
  
      def payment_params
        params.require(:payment).permit(:status)
      end
    end
  end
  