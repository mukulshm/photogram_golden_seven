class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def new_form

  end

  def create_row
    i = Photo.new
    i.caption = params["the_caption"]
    i.source = params["the_source"]
    i.save
    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    i = Photo.find(params["id"])
    i.destroy
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo_id = params["id"]
    @f = Photo.find_by({ :id => @photo_id })
  end

  def update_row
    i = Photo.find_by({ :id => params["id"]})
    i.caption = params["the_caption"]
    i.source = params["the_source"]
    i.save
    redirect_to("http://localhost:3000/photos"+"/"+params["id"])
  end

  def show
    @photo_id = params["id"]
    @f = Photo.find_by({ :id => @photo_id })

    #@list_of_photos = Photo.all
  end
end
