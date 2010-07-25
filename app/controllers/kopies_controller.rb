class KopiesController < ApplicationController
  # GET /kopies
  # GET /kopies.xml
  def index
    @kopies = Kopy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kopies }
    end
  end

  # GET /kopies/1
  # GET /kopies/1.xml
  def show
    @kopy = Kopy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kopy }
    end
  end

  # GET /kopies/new
  # GET /kopies/new.xml
  def new
    @kopy = Kopy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kopy }
    end
  end

  # GET /kopies/1/edit
  def edit
    @kopy = Kopy.find(params[:id])
  end

  # POST /kopies
  # POST /kopies.xml
  def create
    @kopy = Kopy.new(params[:kopy])

    respond_to do |format|
      if @kopy.save
        format.html { redirect_to(@kopy, :notice => 'Kopy was successfully created.') }
        format.xml  { render :xml => @kopy, :status => :created, :location => @kopy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kopy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kopies/1
  # PUT /kopies/1.xml
  def update
    @kopy = Kopy.find(params[:id])

    respond_to do |format|
      if @kopy.update_attributes(params[:kopy])
        format.html { redirect_to(@kopy, :notice => 'Kopy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kopy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kopies/1
  # DELETE /kopies/1.xml
  def destroy
    @kopy = Kopy.find(params[:id])
    @kopy.destroy

    respond_to do |format|
      format.html { redirect_to(kopies_url) }
      format.xml  { head :ok }
    end
  end
end
