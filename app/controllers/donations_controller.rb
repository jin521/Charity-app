class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def show
    @campaign_name = Campaign.find(@donation.campaign_id).name
  end

  def new
    @donation = current_user.donations.build
    campaign = Campaign.find(params[:format])
    @donation.campaign = campaign
  end

  def create
    @campaign = Campaign.find(donation_params[:campaign_id])
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:campaign_id, :email, :amount, :credit_card_details, :user_id)
    end
end
