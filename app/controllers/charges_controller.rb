class ChargesController < ApplicationController
  def create
    product = Product.find(params[:product_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    purchase = Purchase.create(email: params[:stripeEmail], 
      card: params[:stripeToken], amount: product.price_in_cents,
      description: product.description, currency: 'usd',
      user_id: current_user.id, customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)

    redirect_to purchase 

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
