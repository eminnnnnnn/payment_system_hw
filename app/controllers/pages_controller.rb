class PagesController < ApplicationController
  #before_action :set_payment, only: :result
  before_action :authenticate_user!, only: [:fill,:result]
  # before_action :set_params, only: [:result,:fill]
  before_action :set_payment, only: :fill
  before_action :set_params, only: :result

  def index
  end

  def fill

  end

  def result
    # if !@current_payment.valid?
    #   flash[:errors] = @current_payment.errors.messages
    #   redirect_to pages_fill_path(params: {pay_type: session[:current_payment]})
    # else
    #   flash[:success] = "Success!"
    # end
    @current_payment = Payment.find_by(user_id: current_user.id, payment_account: params[:pay_acc], payment_summa: params[:pay_sum])
  end

  def destroy_payment
    payment_for_delete = Payment.find_by(id: params[:payment_del])
    payment_for_delete.destroy
    redirect_to '/'
  end

  def confirm_payment
    payment_for_confirm = Payment.find_by(id: params[:payment_confirm])
    payment_for_confirm[:payment_status] = "PAID"
    payment_for_confirm.save!
    respond_to do |format|
      format.html
      format.json do
         render json: { payment_type: payment_for_confirm[:payment_type],
          payment_account: payment_for_confirm[:payment_account],
          payment_summa: payment_for_confirm[:payment_summa],
          payment_user: payment_for_confirm[:user_id],
          payment_status: "PAID" }
      end
    end
  end

  protected

  # def set_params
  #   # @type_of_payment = params[:pay_type] if params[:pay_type].present? && !@type_of_payment.present?
  #   if params[:commit].present? # && params[:commit] == "Confirm+Payment"
  #     @account_of_payment = params[:pay_acc]
  #     @total_of_payment = params[:pay_sum]
  #     @client_of_payment = current_user.id.to_s
  #   end
  # end

  def set_payment
    session[:current_payment] = params[:pay_type]
  end

  def set_params
    cashback = params[:pay_sum].to_i * 150
    @current_payment = Payment.create(payment_type: session[:current_payment], user_id: current_user.id,payment_account: params[:pay_acc].to_i,payment_summa: params[:pay_sum].to_i, cashback: cashback)
  end
end
