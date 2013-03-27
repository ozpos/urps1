class ActionNamesController < ApplicationController
  before_filter :process_permissions_attrs, only: [:create, :update]

  def process_permissions_attrs
    params[:action_name][:interactions_attributes].values.each do |per_attr|
      per_attr[:_destroy] = true if per_attr[:enable] != '1'
    end
  end

  # GET /action_names
  # GET /action_names.json
  def index
    @action_names = ActionName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_names }
    end
  end

  # GET /action_names/1
  # GET /action_names/1.json
  def show
    @action_name = ActionName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_name }
    end
  end

  # GET /action_names/new
  # GET /action_names/new.json
  def new
    @action_name = ActionName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_name }
    end
  end

  # GET /action_names/1/edit
  def edit
    @action_name = ActionName.find(params[:id])
    @controller_actions = ControllerAction.actions(params[:id]).all
  end

  # POST /action_names
  # POST /action_names.json
  def create
    @action_name = ActionName.new(params[:action_name])

    respond_to do |format|
      if @action_name.save
        format.html { redirect_to @action_name, notice: 'Action name was successfully created.' }
        format.json { render json: @action_name, status: :created, location: @action_name }
      else
        format.html { render action: "new" }
        format.json { render json: @action_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_names/1
  # PUT /action_names/1.json
  def update
    @action_name = ActionName.find(params[:id])

    respond_to do |format|
      if @action_name.update_attributes(params[:action_name])
        format.html { redirect_to @action_name, notice: 'Action name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_names/1
  # DELETE /action_names/1.json
  def destroy
    @action_name = ActionName.find(params[:id])
    @action_name.destroy

    respond_to do |format|
      format.html { redirect_to action_names_url }
      format.json { head :no_content }
    end
  end
end
