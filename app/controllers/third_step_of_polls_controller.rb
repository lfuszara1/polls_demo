class ThirdStepOfPollsController < ApplicationController

  def new
    session[:poll] = {} if session[:poll].nil?
    @poll_three = ThirdStepOfPoll.new
    @poll_session = session[:poll]
  end

  def create
    strong_params = third_step_of_poll_params

    @poll_three = ThirdStepOfPoll.new
    @poll_three.about_you = strong_params[:about_you]

    if @poll_three.valid?
      session[:poll] = session[:poll].merge(
        about_you: @poll_three.about_you
      )

      if params[:third_step_of_poll][:submit]
        full_params = session[:poll]

        Poll.create(full_params)

        session.delete(:poll)
      else
        render json: @poll_three, status: 201
      end
    else
      render json: { message: "Validation failed", errors: @poll_three.errors.messages }, status: 400
    end
  end

  private

  def third_step_of_poll_params
    params.require(:third_step_of_poll).permit(
      :about_you
    )
  end

end