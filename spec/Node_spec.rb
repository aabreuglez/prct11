# encoding: UTF-8
require 'spec_helper'
require 'Bibliography'

describe Node do
  before :each do
    @var1 = Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide",
    "The Facets of Ruby","Pragmatic Bookshelf",4,"July 7, 2013",[9781937785499,1937785491])
    @node1 = Node.new(@var1,nil)
  end
  
  describe "Los nodos funcionan correctamente" do
    it "El node 1 se crea correctamente" do
      expect(@node1.value.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n")
    end
    it "El puntero es nulo" do
      expect(@node1.next).to be_nil
    end
    
  end  
  
end