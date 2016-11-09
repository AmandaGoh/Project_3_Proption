class PropertiesController < ApplicationController
  def index
    @properties=Property.all
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

    redirect_to properties_path
  end
end

# <!-- create_table "properties", force: :cascade do |t|
#   t.string   "name"
#   t.string   "prop_type"
#   t.string   "address"
#   t.integer  "postal_code"
#   t.integer  "reserve_price"
#   t.string   "tenure"
#   t.integer  "size"
#   t.text     "description"
#   t.string   "picture"
#   t.integer  "seller_id"
#   t.datetime "created_at",    null: false
#   t.datetime "updated_at",    null: false
# end -->
