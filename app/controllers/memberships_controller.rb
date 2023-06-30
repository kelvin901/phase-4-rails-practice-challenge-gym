class MembershipsController < ApplicationController
    before_action :set_membership, only: %i[ show edit update destroy ]
    before_action :new_gym_client, only: [ :create ]
    before_action :set_form_variables, only: [ :new ]
  
    # GET /memberships or /memberships.json
    def index
      @memberships = Membership.all
    end
  
    # GET /memberships/1 or /memberships/1.json
    def show
    end
  
    # GET /memberships/new
    def new
  
    end
  
    # GET /memberships/1/edit
    def edit
    end
  
    # POST /memberships or /memberships.json
    def create
      @membership = Membership.new(membership_params)
      respond_to do |format|
          if new_gym_client && @membership.save
            format.html { redirect_to membership_url(@membership), notice: "Membership was successfully created." }
            format.json { render :show, status: :created, location: @membership }
          elsif !new_gym_client
            set_form_variables
            format.html { redirect_to new_membership_url, notice: "Cannot sign up to the same gym twice!" }
            format.json { render json: @membership.errors, status: :unprocessable_entity }
          else
            set_form_variables
            format.html { redirect_to new_membership_url, status: :unprocessable_entity }
            format.json { render json: @membership.errors, status: :unprocessable_entity }
          end 
  
        end
    end
  
    # PATCH/PUT /memberships/1 or /memberships/1.json
    def update
      respond_to do |format|
        if @membership.update(membership_params)
          format.html { redirect_to membership_url(@membership), notice: "Membership was successfully updated." }
          format.json { render :show, status: :ok, location: @membership }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @membership.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # DELETE /memberships/1 or /memberships/1.json
    def destroy
      @membership.destroy
  
      respond_to do |format|
        format.html { redirect_to memberships_url, notice: "Membership was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    def new_gym_client
      Membership.where(gym_id: params[:membership][:gym_id]).where(client_id: params[:membership][:client_id]).count == 0 ? true : false 
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
           
      def set_form_variables
        @clients = Client.all
        @gyms = Gym.all
      end 
  
      def set_membership
        @membership = Membership.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def membership_params
        params.require(:membership).permit(:charge, :client_id, :gym_id)
      end
  
     
  end