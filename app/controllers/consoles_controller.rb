class ConsolesController < ApplicationController

  def index
    consoles = [
      {name: 'NES', manufacture: 'Nintendo'},
      {name: 'SNES', manufacture: 'Nintendo'},
      {name: 'Wii', manufacture: 'Nintendo'},
      {name: 'Genesis', manufacture: 'Sega'},
      {name: 'Xbox', manufacture: 'Microsoft'},
      {name: 'Switch', manufacture: 'Nintendo'},
      {name: 'ps1', manufacture: 'Sony'},
      {name: 'ps2', manufacture: 'Sony'}
    ]

    if params[:manufacture].present?
      consoles = consoles.select do |console|
        console[:manufacture] == params[:manufacture]
      end
    end
    
    render(json: {'consoles' => consoles.map{|console| console[:name]} })
  end
end
