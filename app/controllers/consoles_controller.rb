class ConsolesController < ApplicationController

  def index
    if params[:manufacture].present?
      consoles = Console.where(manufacture: params[:manufacture])
    else
      consoles = Console.all
    end

    render(json: {'consoles' => consoles.map(&:formatted_name) })
  end
end
