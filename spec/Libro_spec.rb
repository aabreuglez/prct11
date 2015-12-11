# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Libro do
    before :each do
        @book1 = Libro.new(['Carlos Ruiz Zafon'],
                            'La Sombra del Viento','','Planeta',9,
                            '10 de Diciembre 2011',
                            [9788408079545])
    end
    
    describe "Un libro es una clase bibliografica" do
        it "Posee el atributo de herencia" do
            expect(Libro<Bibliography).to eq true
        end
        it "Es una clase" do
            expect(Libro.is_a? Class).to be true
        end
        it "Es una clase heredada de Bibliography" do
            expect(Libro.ancestors).to include Bibliography
        end

        it "Es una clase heredada de Object" do
            expect(Libro.ancestors).to include Object
        end
    end
    
    describe "Posee un metodo para mostrarse " do
        it "Se muestra el libro correctamente" do
            expect(@book1.to_s).to eq "Carlos Ruiz Zafon\nLa Sombra del Viento\nPlaneta; 9 edicion (10 de Diciembre 2011)\nISBN-13: 9788408079545\n"
        end
    end
end