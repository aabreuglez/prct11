# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Bibliography do
    before :each do
      @b1 = Bibliography.new(['Carlos Ruiz Zafon'],
                               'La Sombra del Viento','','Planeta',9,
                               '10 de Diciembre 2011',
                               [9788408079545]
                               )
      @b2 = Bibliography.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers´ Guide',
                                '(The Facets of Ruby)','Pragmatic Bookshelf',4,'July 7, 2013',[9781937785499,1937785491])
                            
    end
    describe "# Debe existir uno o mas autores" do
        it "#El autor debe ir en array" do
          expect {Bibliography.new('Zafon','La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
        end
        it "#No acepta arrays vacios en el autor" do
          expect {Bibliography.new(Array.new(),'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
        end
        it "#No acepta otro tipo de array en el autor" do
          expect {Bibliography.new(Hash.new(),'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
        end
        it "#No acepta un array de no string en el autor" do
          expect {Bibliography.new([1],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
        end     
        it "#Acepta un array unico de string en el autor" do
          expect {Bibliography.new(['Zafon'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
        end
        it "#Acepta un array multiple de string en el autor" do
          expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
        end
    end
    
    describe "Test debe existir un titulo." do
      it "#Rechaza acepta una no string de titulo" do
        expect {Bibliography.new(['Zafon','Murakami'],1,'','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
      end
      it "#Acepta una string de titulo" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end
    end
    
    describe "Test puede existir o no una serie." do
      it "#Permite omitir el valor de serie" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end 
      it "#Rechaza una serie que no es una string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento',1,'Planeta',9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
      end 
      it "#Se acepta una serie si es una string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end
   end
   
    describe "Test debe existir una editorial." do
      it "#Rechazamos una editorial no string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados',[],9,'10 de Diciembre 2011',[9788408079545])}.to raise_error
      end
      it "#Aceptamos una editorial si es una string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end
    end
    
    describe "Test debe existir un numero de edicion." do
      it "#Rechazar la edicion si no es un numero" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',[],'10 de Diciembre 2011',[9788408079545])}.to raise_error
      end 
      it "#Aceptar la edicion si es un numero" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end 
    end
    
    describe "Test debe existir una fecha de publicacion." do
      it "#Rechazar la fecha si no es una string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',9,10122011,[9788408079545])}.to raise_error
      end 
      it "#Aceptar la fecha si es una string" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento','Libros olvidados','Planeta',9,'10 de Diciembre 2011',[9788408079545])}.not_to raise_error
      end 
    end
    
    describe "Test debe existir uno o mas numeros ISBN." do
      it "#Rechazar si no hay ningun ISBN" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento',
                       'Libros olvidados',
                       'Planeta',
                       9,
                       '10 de Diciembre 2011',
                     [])}.to raise_error
      end 
      it "#Aceptar si hay un ISBN" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento',
                     'Libros olvidados',
                     'Planeta',
                     9,
                     '10 de Diciembre 2011',
                     [9788408079545])}.not_to raise_error
      end 
      it "#Aceptar si hay mas de un ISBN" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento',
                     'Libros olvidados',
                     'Planeta',
                     9,
                     '10 de Diciembre 2011',
                     [9788408079545,1234567890])}.not_to raise_error
      end 
      it "#Rechazar si un isbn no es un numero" do
        expect {Bibliography.new(['Zafon','Murakami'],'La Sombra del Viento',
                     'Libros olvidados',
                     'Planeta',
                     9,
                     '10 de Diciembre 2011',
                     ['a'])}.to raise_error
      end
    end
    
    describe "Existen los gets necesarios" do
      it "Existe un metodo para obtener autores" do
        @b1.autor.should match_array(["Carlos Ruiz Zafon"])
      end
      it "Existe un metodo para obtener el titulo" do
        @b1.titulo.should == "La Sombra del Viento"
      end
      it "Existe un metodo para obtener la serie" do
          @b1.serie.should == ""
      end
      it "Existe un metodo para obtener la editorial" do
         @b1.editorial.should == "Planeta"
      end
      it "Existe un metodo para obtener el numero de edicion" do
        @b1.edicion.should == 9
      end
      it "Existe un metodo para obtener la fecha de publicacion" do
        @b1.fecha.should == '10 de Diciembre 2011'
      end
      it "Existe un metodo para obtener el listado de ISBN" do
        @b1.isbn.should match_array([9788408079545])
      end
      it "Existe un metodo para obtener la referencia formateada" do
        @b1.to_s.should == "Carlos Ruiz Zafon\nLa Sombra del Viento\nPlaneta; 9 edicion (10 de Diciembre 2011)\nISBN-13: 9788408079545\n"
        @b2.to_s.should == "Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers´ Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"
      end
    end
    
end