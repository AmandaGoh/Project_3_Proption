class PropertiesController < ApplicationController
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
    # session
  end

  def update_listed_status
    @property = Property.find(params[:id])
    listing_id = @property.listing.id

    @property.listed = listed_params[:listed]
    @property.save

    head :no_content
  end

  private

  def listed_params
    params.permit(:listed)
  end

end
