# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe ArtRev do
    before :each do
        @rev1 = ArtRev.new(["CASTAGNINO, Juan M"],"Técnicas, materiales y aplicaciones en nanotecnología",
        "Acta Bioquímica Clínica Latinoamericana",41,2,"Abril 2007")
    end
    
    describe "Se crea el objeto correctamente " do
        it "Acepta los argumentos necesarios" do
            expect {ArtRev.new(["CASTAGNINO, Juan M"],"Técnicas, materiales y aplicaciones en nanotecnología",
        "Acta Bioquímica Clínica Latinoamericana",41,2,"Abril 2007")}.to_not raise_error
        end
        it "Necesita los parametros" do
            expect {ArtRev.new()}.to raise_error
        end
    end
    describe "Un libro es una clase bibliografica" do
        it "Posee el atributo de herencia" do
            expect(ArtRev<Bibliography).to eq true
        end
        it "Es una clase" do
            expect(ArtRev.is_a? Class).to be true
        end
        it "Es una clase heredada de Bibliography" do
            expect(ArtRev.ancestors).to include Bibliography
        end

        it "Es una clase heredada de Object" do
            expect(ArtRev.ancestors).to include Object
        end
        
        it "No hereda te otra clase como Libro" do
            expect(ArtRev.ancestors).to_not include Libro
        end
        
        it "Comprobacion con is_a" do
            expect(@rev1.is_a? Object).to eq true
        end
    end
    
    describe "Se puede acceder a los nuevos elementos" do
        it "Existe un metodo para acceder al titulo de la revista" do
            expect(@rev1.titrev).to eq("Acta Bioquímica Clínica Latinoamericana")
        end
        
        it "Existe un metodo para acceder al volumen" do
            expect(@rev1.volumen).to eq(41)
        end
        
        it "Existe un metodo para acceder al numero de paginas" do
            expect(@rev1.paginas).to eq(2)
        end
    end
    
    describe "Existe un metodo  para montar los datos formateados" do
        it "El metodo to_s funciona perfectamente" do
            expect(@rev1.to_s).to eq("CASTAGNINO, Juan M, Técnicas, materiales y aplicaciones en nanotecnología. Acta Bioquímica Clínica Latinoamericana\n41,2,Abril 2007")  
        end
    end
end