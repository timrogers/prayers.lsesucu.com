class PrayersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  load_and_authorize_resource

  def index
    @prayers = Prayer.all.order("created_at DESC")
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @prayer.update_attributes(prayer_params)
      redirect_to prayer_path(@prayer), notice: "Thanks - your prayer request has been updated."
    else
      render :edit
    end
  end

  def create
    @prayer = current_user.prayers.new(prayer_params)

    if @prayer.save
      redirect_to prayers_path, notice: "Thanks - your prayer request has been logged."
    else
      render :edit
    end
  end

  def destroy
    if @prayer.destroy
      redirect_to prayers_path, notice: "Your prayer request has been deleted."
    else
      redirect_to prayer_path(prayer), notice: "Your prayer could not be deleted. " \
                                               "Please try again later."
    end
  end

  private

  def prayer_params
    params.require(:prayer).permit(:anonymous, :body, :title)
  end
end
