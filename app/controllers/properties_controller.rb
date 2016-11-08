class PropertiesController < ApplicationController
  def new
  @property = Property.new
  end

  def create
    @new_property = Property.new()
    @new_property.prop_type = params[:property][:prop_type]
    @new_property.address = params[:property][:address]
    @new_property.postal_code = params[:property][:postal_code]
    @new_property.tenure = params[:property][:tenure]
    @new_property.size = params[:property][:size]
    @new_property.description = params[:property][:email]
    @new_property.save

    redirect_to properties_path
  end
end

# <!-- t.string :prop_type
# t.string :address
# t.integer :postal_code
# t.string :Tenure
# t.integer :size
# t.text :description -->
