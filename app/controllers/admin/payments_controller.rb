module Admin
  class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @year = params[:year] || Date.current.year
      @months = %w[January February March April May June July August September October November December]
      @payments = Payment.where(year: @year)
      @users = User.all
    end

    def new
      @payment = Payment.new
    end

    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to admin_payments_path, notice: 'Payment record created successfully.'
      else
        render :new
      end
    end

    def update
      @payment = Payment.find(params[:id])
      if @payment.update(payment_params)
        redirect_to admin_payments_path, notice: 'Payment updated.'
      else
        render :index
      end
    end

    private

    def payment_params
      params.require(:payment).permit(:user_id, :year, :month, :amount, :status)
    end

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
