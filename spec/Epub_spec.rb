# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Epub do
    before :each do
        @epub1 = Epub.new(["WOLLSTONECRAFT"],"M. A vindication of the rights of women","en línea","New York",1996,"5 mayo 1997",
        "Disponible")
    end
    
    describe "Se crea el objeto correctamente " do
        it "Acepta los argumentos nece sarios" do
            expect{ Epub.new(["WOLLSTONECRAFT"],"M. A vindication of the rights of women","en línea","New York",1996,"5 mayo 1997","Disponible") }.to_not raise_error
        end
        it "Necesita los parametros" do
            expect {Epub.new()}.to raise_error
        end
    end
    describe "Un libro es una clase bibliografica" do
        it "Posee el atributo de herencia" do
            expect(Epub<Bibliography).to eq true
        end
        it "Es una clase" do
            expect(Epub.is_a? Class).to be true
        end
        it "Es una clase heredada de Bibliography" do
            expect(Epub.ancestors).to include Bibliography
        end

        it "Es una clase heredada de Object" do
            expect(Epub.ancestors).to include Object
        end
        
        it "No hereda te otra clase como Libro" do
            expect(Epub.ancestors).to_not include Libro
        end
        
        it "No hereda te  otra clase como Libro" do
            expect(Epub.kind_of?Libro).to_not be true
        end
    end
    
    describe "Es un objeto distinto" do
        it "Posee nuevos métodos para acceder al soporte" do
            expect(@epub1.soporte).to eq("en línea")
        end
        it "Posee nuevos métodos para acceder a los atributos" do
            expect(@epub1.fechaconsulta).to eq("5 mayo 1997")
        end
        it "Posee nuevos métodos para acce der a los atributos" do
            expect(@epub1.disponibilidad).to eq("Disponible")
        end
    end
    
    describe "Se  imprim e correctamente" do
        it "Devuelve la salida formateada" do
            expect(@epub1.to_s).to eq("WOLLSTONECRAFT, M. A vindication of the rights of women [en línea], New York, 1996, 5 mayo 1997, Disponible")
        end
    end
end