class ProductsController < ApplicationController
  
  before_filter :carted_products
  
  # GET /yourcart
  # GET /yourcart.json
  def carted_products
    @carted_products = Product.where(:in_cart => true)
    # @subtotal = @carted_products.collect(params[:price])
  end


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @carted_products = Product.where(:in_cart => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # def add_to_cart 
  #   id = params[:id]
  #   @product = Product.find id
  #   @product.in_cart = true
  #   @product.save

  #   @product.update_attributes({:in_cart => true})
  # end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format| #respond_to is a method that looks inside the params hash that exposes format
      #passing the format into this block -> when the format is HTML, blah blah, when JSON, blah blahh
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
