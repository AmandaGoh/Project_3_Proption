class PropertiesController < ApplicationController
  def index
    @properties=Property.all

    respond_to do |format|
      format.html
      format.json { render json: @properties }
    end
  end
  def show
    @property = Property.find(params[:id])
  end
  def new
    @property = Property.new
  end
  def create
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
    @new_property.seller_id = params[:property][:seller_id]
    @new_property.save
    @new_property.errors.full_messages


    redirect_to properties_path
  end
end
