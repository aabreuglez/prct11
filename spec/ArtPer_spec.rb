# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'


describe ArtPer do
    before :each do
        @per1 = ArtPer.new(["Ramirez"],"Mojo picon","El dia","Tenerife","11 de Noviembre de 2014","Seccion Nuestra Gente",1)
    end
    
    describe "Se crea el objeto correctamente " do
        it "Acepta los argumentos necesarios" do
            expect{ ArtPer.new(["Ramirez"],"Mojo picon","El dia","Tenerife","11 de Noviembre de 2014","Seccion Nuestra Gente",1)}.to_not raise_error
        end
        it "Necesita los parametros" do
            expect {ArtPer.new()}.to raise_error
        end
    end
    describe "Un libro es una clase bibliografica" do
        it "Posee el atributo de herencia" do
            expect(ArtPer<Bibliography).to eq true
        end
        it "Es una clase" do
            expect(ArtPer.is_a? Class).to be true
        end
        it "Es una clase heredada de Bibliography" do
            expect(ArtPer.ancestors).to include Bibliography
        end

        it "Es una clase heredada de Object" do
            expect(ArtPer.ancestors).to include Object
        end
        
        it "No hereda te otra clase como Libro" do
            expect(ArtPer.ancestors).to_not include Libro
        end
    end
    
    describe "Es un objeto distinto" do
        it "Posee nuevos métodos para acceder a los atributos" do
            expect(@per1.diario).to eq("El dia")
        end
        it "Posee nuevos métodos para acceder a los atributos" do
            expect(@per1.lugar).to eq("Tenerife")
        end
        it "Posee nuevos métodos para acceder a los atributos" do
            expect(@per1.paginacion).to eq("Seccion Nuestra Gente")
        end
    end
    
    describe "Se  imprime correctament e" do
        it "Devuelve la salida formateada" do
            expect(@per1.to_s).to eq("Ramirez,Mojo picon\nEl dia,Tenerife,11 de Noviembre de 2014\nSeccion Nuestra Gente,1")
        end
    end
end