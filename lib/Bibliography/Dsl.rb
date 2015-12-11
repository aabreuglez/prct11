class Dsl
    attr_accessor :titulo, :lista, :apa

    def initialize(titulo, &block)
        @titulo = titulo
        @lista=[]
        
        if block_given?  
          if block.arity == 1
            yield self
          else
           instance_eval &block 
          end
        end
        @apa = Apa.new(lista)
    end
    
    def libro(titulo, atributos={})
        a = Libro.new(atributos[:autor],titulo,atributos[:editorial],
        atributos[:edicion],atributos[:fecha],atributos[:isbn])
        lista.push(a)
    end

    def art(titulo, atributos={})
        a = ArtRev.new(atributos[:autor],titulo,atributos[:revista],
        atributos[:volumen],atributos[:paginas],atributos[:fecha])
        lista.push(a)
    end
    
    def per(titulo, atributos={})
        a = ArtPer.new(atributos[:autor],titulo,atributos[:diario],atributos[:lugar],atributos[:fecha],atributos[:paginacion],atributos[:columna])
        lista.push(a)
    end
    
    def epub(titulo, atributos={})
        a = Epub.new(atributos[:autor],titulo,atributos[:soporte],
        atributos[:lugar],atributos[:fecha],atributos[:fechaconsulta],atributos[:disponibilidad])
        lista.push(a)
    end
    
    
    def to_s
       @apa.to_s
    end
end