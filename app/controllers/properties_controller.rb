class PropertiesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :update, :destroy], notice: 'you must sign in first!'
  # before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @properties=Property.all

    respond_to do |format|
      format.html
      format.json { render json: @properties }
    current_user
    end
  end

  #get properties/1
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
    unless current_user.id == @property.seller_id
      redirect_to root_path, :alert => "You can only edit your properties"
    end
  end

  def property_params
  params.require(:property).permit(:name,:prop_type, :address, :postal_code, :reserve_price, :tenure, :size, :description, :picture, :seller_id, :listed)
  end

  # POST /properties
  # POST /properties.json
  def update
    @property =Property.find(params[:id])
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Your property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  #get properties/new
  def new
    @property = Property.new
  end
  def create
    current_user
    @new_property = Property.new()
    @new_property.name = params[:property][:name]
    @new_property.prop_type = params[:property][:prop_type]
    @new_property.address = params[:property][:address]
    @new_property.postal_code = params[:property][:postal_code]
    @new_property.reserve_price = params[:property][:reserve_price]
    @new_property.tenure = params[:property][:tenure]
    @new_property.size = params[:property][:size]
    @new_property.description = params[:property][:description]
    @new_property.picture = params[:property][:picture]
    @new_property.seller_id = current_user.id
    @new_property.save
    @new_property.errors.full_messages
    redirect_to myproperties_path
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    respond_to do |format|
      format.html { redirect_to myproperties_url, notice: 'You have successfully deleted your property' }
      format.json { head :no_content }
    end
  end

  def myproperties
    @my_properties=current_user.properties
    # @property = Property.find(params[:id])
    # @not_listed = @property.listed < 1 ? true: false

    # session
  end


end
