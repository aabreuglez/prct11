# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Lista do
  before :each do
    @var1 = Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide",
    "The Facets of Ruby","Pragmatic Bookshelf",4,"July 7, 2013",[9781937785499,1937785491])
    @var2 = Bibliography.new(["Scott Chacon"],"Pro Git 2009th Edition","Pro","Apress",2009,"August 27, 2009",[9781430218333,1430218339])
    @var3 = Bibliography.new(["David Flanagan", "Yukihiro Matsumoto"],"The Ruby Programming Language","O'Reilly Media",1,"February 4, 2008",[1596516177,9780596516178])
    @var4 = Bibliography.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec,Cucumber, and Friends","The Facets of Ruby","Pragmatic Bookshelf",1,"December 25, 2010",[1934356379,9781934356371])
    @var5 = Bibliography.new(["Richard E"], "Silverman Git Pocket Guide","O'Reilly Media",1,"(August 2, 2013)",[1449325866,9781449325862])

    @b1 = Lista.new([@var1,@var2,@var3])
    @b2 = Lista.new([@var1,@var2])
    @b3 = Lista.new([@var1])    
  end
  
  describe "Metodos de enumerable" do
      it "Se puede recorrer con self" do
          expect(@b2.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\nScott Chacon\nPro Git 2009th Edition\nPro\nApress; 2009 edicion (August 27, 2009)\nISBN-13: 9781430218333\nISBN-10: 1430218339\n")
      end
      it "Devuelve el nodo minimo" do
          expect(@b1.min.value.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n")
      end
      it "Devuelve el nodo maximo" do
          expect(@b1.max.value.to_s).to eq("Scott Chacon\nPro Git 2009th Edition\nPro\nApress; 2009 edicion (August 27, 2009)\nISBN-13: 9781430218333\nISBN-10: 1430218339\n")
      end
      it "Realiza un conteo de los nodos" do
          expect(@b1.count).to eq(3)
          expect(@b3.count).to_not eq(2)
      end
      
      it "Posee el metodo collect" do
          expect(@b3.collect{|i| i.value.to_s}).to eq(["Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"])

      end
      
      it "Posee el metodo any?" do
          expect(@b2.any?).to be true
          expect(@b3.any?).to_not be false
      end
      
      it "Posee el metodo find" do
          expect(@b1.find {|i| i.value==@var1}.value).to eq(@var1)
      end
  end
end

describe Bibliography do
    before :each do
        @b1 = Bibliography.new(['Carlos Ruiz Zafon'],
                               'La Sombra del Viento','','Planeta',9,
                               '10 de Diciembre 2011',
                               [9788408079545]
                               )
                               
        @b2 = Bibliography.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers´ Guide',
                                '(The Facets of Ruby)','Pragmatic Bookshelf',4,'July 7, 2013',[9781937785499,1937785491])
                            
        
         @b3 = Bibliography.new(['Carlos Ruiz Zafon'],
                               'La Sombra del Viento','','Planeta',8,
                               '10 de Diciembre 2011',
                               [9788408079545]
                               )    
        @b3 = Bibliography.new(['Carlos Ruiz Zafon'],
                               'La Sombra del Viento','','Planeta',8,
                               '10 de Diciembre 2011',
                               [9788408079545]
                               )
        @b4 = Bibliography.new(['Carlos Ruiz Zafon'],
                               'La Sombra del Viento','','DeBolsillo',8,
                               '10 de Diciembre 2014',
                               [9788408079545]
                               )
    end
    
    describe "Tiene las propiedades de comparable" do
        it "Los nodos se comparar por autor, el primer autor en caso de varios " do
            expect(@b1<@b2).to be true
        end
        
        it "Dos nodos pueden ser iguales a pesar de ser de distinta edicion" do
            expect(@b1==@b3).to be true
        end
        
        it "Dos libros idénticos pueden haber sido publicados por editoriales diferentes y ser distintos en fecha" do
            expect(@b1).to_not eq(@b4)
        end
        
        it "Un libro solo puede compararse con un libro" do
            expect{ @b1<2 }.to raise_error
        end
    end
end