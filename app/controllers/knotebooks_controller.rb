class KnotebooksController < ApplicationController
  # GET /knotebooks
  # GET /knotebooks.xml
  def index
    @knotebooks = Knotebook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knotebooks }
    end
  end

  # GET /knotebooks/1
  # GET /knotebooks/1.xml
  def show
    @knotebook = Knotebook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knotebook }
    end
  end

  # GET /knotebooks/new
  # GET /knotebooks/new.xml
  def new
    @knotebook = Knotebook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knotebook }
    end
  end

  # GET /knotebooks/1/edit
  def edit
    @knotebook = Knotebook.find(params[:id])
  end

  # POST /knotebooks
  # POST /knotebooks.xml
  def create
    @knotebook = Knotebook.new(params[:knotebook])

    respond_to do |format|
      if @knotebook.save
        format.html { redirect_to(@knotebook, :notice => 'Knotebook was successfully created.') }
        format.xml  { render :xml => @knotebook, :status => :created, :location => @knotebook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knotebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knotebooks/1
  # PUT /knotebooks/1.xml
  def update
    @knotebook = Knotebook.find(params[:id])

    respond_to do |format|
      if @knotebook.update_attributes(params[:knotebook])
        format.html { redirect_to(@knotebook, :notice => 'Knotebook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knotebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knotebooks/1
  # DELETE /knotebooks/1.xml
  def destroy
    @knotebook = Knotebook.find(params[:id])
    @knotebook.destroy

    respond_to do |format|
      format.html { redirect_to(knotebooks_url) }
      format.xml  { head :ok }
    end
  end
end
