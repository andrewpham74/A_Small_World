class Purchase < ActiveRecord::Base
	belongs_to :user
  # after_create :email_purchaser

  def to_param
    uuid
  end

  private

  # def email_purchaser
  #   PurchaseMailer.purchase_receipt(self).deliver
  # end

end
