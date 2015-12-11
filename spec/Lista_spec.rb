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
    #@node1 = Node.new(@var1,nil)
    #@node2 = Node.new(@var2,nil)
    #@node3 = Node.new(@var3,nil)
    #@node4 = Node.new(@var4,nil)
    #@node5 = Node.new(@var5,nil)
    #@node6 = Node.new(@var1,nil)
    #@b1 = Lista.new([@node1,@node2,@node3])
    #@b2 = Lista.new([@node4])
    #@b3 = Lista.new([@node6])
    @b1 = Lista.new([@var1,@var2,@var3])
    @b2 = Lista.new([@var3])
    @b3 = Lista.new([@var4])
  end
  

  
  describe "Se extrae el primer elemento de la lista" do
    it "Podemos hacer un pop y equivale a node1" do
      expect(@b1.pop_front.to_s).to eq "Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"
    end
    
    it "Si la extracción ha sido exitosa, ahora deberia salir node2" do
      @b1.pop_front
      expect(@b1.pop_front.to_s).to eq "Scott Chacon\nPro Git 2009th Edition\nPro\nApress; 2009 edicion (August 27, 2009)\nISBN-13: 9781430218333\nISBN-10: 1430218339\n"
    end
  end
  
  describe "Se puede insertar un elemento" do
     it "Existe un metodo para realizar la insercion simple por detras " do
       expect(@b1).to respond_to(:push_back)
     end
     it "Existe un metodo para realizar la insercion simple por delante " do
       expect(@b1).to respond_to(:push_front)
     end
     it "Permite insertar cualquier tipo de nodo" do
       expect { @b1.push_front([1]) }.to_not raise_error
     end
     it "Inserta un elemento por detrás" do
       @b2.push_back(@var2)
       expect(@b2.cabeza.value.to_s).to eq(@var2.to_s)
     end
     it "Inserta un elemento por delante" do
       @b2.push_front(@var2)
       expect(@b2.cola.value.to_s).to eq(@var2.to_s)
     end
  end
  describe "Se pueden insertar varios elementos" do
    it "Existe un metodo para realizar la insercion multiple por delante" do
       expect(@b1).to respond_to(:push_much_front)
     end
    it "Existe un metodo para realizar la insercion multiple por detrás" do
       expect(@b1).to respond_to(:push_much_back)
     end
     it "Permite insertar cualquier tipo de nodo" do
       expect { @b2.push_much_front([@var3,@var2,1]) }.to_not raise_error
     end
     it "Inserta varios elementos" do
       @b2.push_much_front([@var2,@var3])
       expect(@b2.cabeza.value.to_s).to eq(@var3.to_s)
       @b2.pop_back
       expect(@b2.cabeza.value.to_s).to eq(@var2.to_s)
     end   
  end
  
  describe "Debe existir una Lista con su cabeza" do
    it "La lista no puede quedar vacia" do
      expect { @b3.pop_back }.to raise_error
    end
  end
  
  describe "Permite hacer pop multiple" do
    it "Se extraen dos nodos comprobar primero" do
      expect(@b1.pop_much_front(2)[0].value.to_s).to eq "Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"
    end
    it "Se extraen dos nodos, comprobar segundo" do
      expect(@b1.pop_much_front(2)[1].value.to_s).to eq "Scott Chacon\nPro Git 2009th Edition\nPro\nApress; 2009 edicion (August 27, 2009)\nISBN-13: 9781430218333\nISBN-10: 1430218339\n"
    end
    it "No acepta no numeros como parametros" do
      expect { @b1.pop_much_front('a') }.to raise_error
    end
  end
  
  describe "Debe haber un metodo para recorrer la lista" do
    it "Recorre de cola a cabeza" do
      expect(@b1.toHead.value.to_s).to eq @var3.to_s
    end
    it "Recorre de cabeza a cola" do
      expect(@b1.toTail.value.to_s).to eq @var1.to_s
    end
  end

  describe "Propiedad de enumerable" do
    it "Se puede recorrer con un each" do
      @b3.each{|i| i}
    end
  end
  describe "Se puede recorrer la lista con el each" do
    it "Se muestra la salida formateada" do
      expect(@b3.to_s).to eq(@var4.to_s)
    end
  end  

end