# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Dsl do
  before :each do
    
    @apa1 = Dsl.new("Lista APA 2015") do
      libro "La Sombra del Viento",
            :autor => ["Carlos Ruiz"],
            :editorial => "Planeta",
            :edicion => 9,
            :fecha => "10 de Diciembre 2011",
            :isbn => [9788408079545]
      
      per "Mojo Picon",
          :autor => ["Ramiro Benitez"],
          :diario => "El dia",
          :lugar => "Tenerife",
          :fecha => "11 de Noviembre de 2014",
          :paginacion => "Seccion Nuestra Gente",
          :columna => 1

      art "Técnicas, materiales y aplicaciones en nanotecnología",
          :autor => ["CASTAGNINO, Juan M"],
          :revista => "Acta Bioquímica Clínica Latinoamericana",
          :volumen => 41,
          :paginas => 2,
          :fecha => "Abril 2007"

      epub "M. A vindication of the rights of women",
            :autor => ["WOLLS TONECRAFT"],
            :soporte => "en linea",
            :lugar => "New York",
            :fecha => "1996",
            :fechaconsulta => "5 mayo 1997",
            :disponibilidad => "Disponible"
     end
  end
    
    describe "Pruebas basicas" do
      it "Se crea correctamente" do
         expect(@apa1).to_not be nil
      end
    end
    
    describe "Funciona " do
      it "Se muestra en formato apa" do
         expect(@apa1.to_s).to eq "Benitez Ramiro (11 de Noviembre de 2014). Mojo Picon. El dia,\\nJuan CASTAGNINO, M (2007). Técnicas, Materiales Y Aplicaciones En Nanotecnología, Acta Bioquímica Clínica Latinoamericana (2) (41)\\nRuiz Carlos (2011). La Sombra Del Viento (9) ().Planeta\\nTONECRAFT WOLLS (5 mayo 1997). M. A Vindication Of The Rights Of Women, [en linea]. New York: .[1996]\\n"
      end
    end
    
    
end