class ControllerNamesController < ApplicationController
  before_filter :process_permissions_attrs, only: [:create, :update]

  def process_permissions_attrs
    params[:controller_name][:interactions_attributes].values.each do |per_attr|
      per_attr[:_destroy] = true if per_attr[:enable] != '1'
    end
  end

  # GET /controller_names
  # GET /controller_names.json
  def index
    @controller_names = ControllerName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @controller_names }
    end
  end

  # GET /controller_names/1
  # GET /controller_names/1.json
  def show
    @controller_name = ControllerName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @controller_name }
    end
  end

  # GET /controller_names/new
  # GET /controller_names/new.json
  def new
    @controller_name = ControllerName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @controller_name }
    end
  end

  # GET /controller_names/1/edit
  def edit
    @controller_name = ControllerName.find(params[:id])
    @controller_actions = ControllerAction.controllers(params[:id]).all
  end

  # POST /controller_names
  # POST /controller_names.json
  def create
    @controller_name = ControllerName.new(params[:controller_name])

    respond_to do |format|
      if @controller_name.save
        format.html { redirect_to @controller_name, notice: 'Controller name was successfully created.' }
        format.json { render json: @controller_name, status: :created, location: @controller_name }
      else
        format.html { render action: "new" }
        format.json { render json: @controller_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /controller_names/1
  # PUT /controller_names/1.json
  def update
    @controller_name = ControllerName.find(params[:id])

    respond_to do |format|
      if @controller_name.update_attributes(params[:controller_name])
        format.html { redirect_to @controller_name, notice: 'Controller name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @controller_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controller_names/1
  # DELETE /controller_names/1.json
  def destroy
    @controller_name = ControllerName.find(params[:id])
    @controller_name.destroy

    respond_to do |format|
      format.html { redirect_to controller_names_url }
      format.json { head :no_content }
    end
  end
end
