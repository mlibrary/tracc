class MilestonesController < ApplicationController
	protect_from_forgery with: :null_session


  # POST /milestones
  def create
    @milestone = Milestone.new(milestone_params)

    respond_to do |format|
      if @milestone.save
      	format.js { @milestone = Milestone.new(milestone_params) }
        format.html { redirect_to @milestone, notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end


end
