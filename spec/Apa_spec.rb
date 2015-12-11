# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'


describe Apa do
    before :each do
      @b1 = Libro.new(['Carlos Ruiz'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])
      @b2 = Libro.new(['Haruki Murakami'],'Tokio Blues','','Tusquets',8,'12 de Octubre de 2013',[4269218200010])
      @b3 = Libro.new(['Carlos Ruiz'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])
      @b4 = ArtPer.new(['Benito Ramirez'],"Mojo picon","El dia","Tenerife","11 de Noviembre de 2014","Seccion Nuestra Gente",1)
      @b5 = ArtRev.new(["Juan Castagnino"],"Técnicas, materiales y aplicaciones en nanotecnología","Acta Bioquímica Clínica Latinoamericana",41,2,"Abril 2007")
      @b6 = Epub.new(["Wolf StoneCraft"],"M. A vindication of the rights of women","en línea","New York",1996,"5 mayo 1997","Disponible")
      @b7 = Libro.new(['Carlos Ruiz','Haruki Murakami'],'La Sombra del Viento','','Planeta',9,'10 de Diciembre 2011',[9788408079545])
      #@b5 = ArtRev.new()
      @b8 = Libro.new(['Gum Zapato'],'A','','A',0,'2011',[1234567891012])
      @b9 = Libro.new(['Haruki Murakami'],'B','','B',0,'2013',[1234567891012])
      @b10 = Libro.new(['Haruki Murakami'],'B','','B',0,'2013',[1234567891012])
      @b11 = Libro.new(['Haruki Murakami','Carlos Ruiz'],'B','','B',0,'2013',[1234567891012])
      @b12 = Libro.new(['Haruki Murakami'],'B','','B',0,'2013',[1234567891012])
      @b13 = Libro.new(['Haruki Murakami'],'B','','B',0,'2015',[1234567891012])
      @b15 = Libro.new(['Haruki Murakami'],'B','','B',0,'2013',[1234567891012])
      @b14 = Libro.new(['Haruki Murakami'],'C','','C',0,'2013',[1234567891012])
      @apa1 = Apa.new([@b1,@b2])
      @apa2 = Apa.new([@b3])
      @apa3 = Apa.new([@b4])
      @apa4 = Apa.new([@b5])
      @apa5 = Apa.new([@b6])
      @apa6 = Apa.new([@b7])
      @apa7 = Apa.new([@b8,@b9])
      @apa8 = Apa.new([@b11,@b10])
      @apa9 = Apa.new([@b13,@b12])
      @apa10 = Apa.new([@b15,@b14])
    end
    
    it "Existe una lista APA" do
        expect(@apa1.cabeza).to_not be nil
        
    end
    
    it "El nombre se invierte con el apellido" do
        expect(@apa1.pop_front.autor).to eq(["Murakami Haruki"])
    end
    it "El formato esperado es correcto para libros" do
        expect(@apa2.to_s.split('\n').at(0)).to eq("Ruiz Carlos (2011). La Sombra Del Viento (9) ().Planeta")
    end
    
    it "El formato esperado es correcto para articulos" do
        expect(@apa4.to_s.split('\n').at(0)).to eq("Castagnino Juan (2007). Técnicas, Materiales Y Aplicaciones En Nanotecnología, Acta Bioquímica Clínica Latinoamericana (2) (41)")
    end
    
    it "El formato es correcto apra articulos de periodicos" do
        expect(@apa3.to_s.split('\n').at(0)).to eq("Ramirez Benito (11 de Noviembre de 2014). Mojo Picon. El dia,")
    end
    
    it "El formato es correcto para publicaciones electronicas" do
      #@b6 = Epub.new(["Wolf StoneCraft"],"M. A vindication of the rights of women","en línea","New York",1996,"5 mayo 1997","Disponible")
       expect(@apa5.to_s.split('\n').at(0)).to eq("StoneCraft Wolf (5 mayo 1997). M. A Vindication Of The Rights Of Women, [en línea]. New York: .[1996]")
    end
    
    it "Los autores se muestran con &" do
      expect(@apa6.to_s.split("(").at(0)).to eq("Ruiz Carlos & Murakami Haruki ")
    end
    
    it "Los autores se ordenan por apellido " do
      expect(@apa7.to_s.split('\n').at(0).split("(").at(0)).to eq("Murakami Haruki ")

      expect(@apa7.to_s.split('\n').at(1).split("(").at(0)).to eq("Zapato Gum ")
    end
    
    it "Se muestran primero las publicaciones de un solo autor" do
      expect(@apa8.to_s.split('\n').at(0).split("(").at(0)).to eq("Murakami Haruki ")

      expect(@apa8.to_s.split('\n').at(1).split("(").at(0)).to eq("Murakami Haruki & Ruiz Carlos ")
    end
    
    it "Se muestran primero las publicaciones antiguas del mismo autor " do
      expect(@apa9.to_s.split('\n').at(0).split("(").at(1).split(")").at(0)).to eq("2013")
      expect(@apa9.to_s.split('\n').at(1).split("(").at(1).split(")").at(0)).to eq("2015")

    end
    
    it "Se ponen sufijos a los años en el caso de mismo autor y año" do
      expect(@apa10.to_s.split('\n').at(0).split("(").at(1).split(")").at(0)).to eq("2013A")
      expect(@apa10.to_s.split('\n').at(1).split("(").at(1).split(")").at(0)).to eq("2013B")

    end
    
    it "Se capializan los titulos" do
      expect(@apa1.pop_back.titulo).to eq("La Sombra Del Viento")
    end
end