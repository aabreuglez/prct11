class ArtRev < Bibliography
    #attr_reader :autor, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    attr_reader :titrev, :volumen, :paginas
    
    #["CASTAGNINO, Juan M"],"Técnicas, materiales y aplicaciones en nanotecnología",
    #    "Acta Bioquímica Clínica Latinoamericana",41,2,"Abril 2007")
    def initialize(*args) 
        raise unless args.length == 6
        @autor = args[0]
        @titulo = args[1]
        @titrev = args[2]
        @volumen = args[3]
        @paginas = args[4]
        @fecha = args[5]
    end
    
    def to_s
        devolver=""
        #CASTAGNINO, Juan M, Técnicas, materiales y aplicaciones en nanotecnología. 
        #Acta Bioquímica Clínica Latinoamericana\n41,2,Abril 2007")  
        for i in @autor do
            devolver += i
            devolver += ","
        end
        devolver += " "
        devolver += @titulo
        devolver += ". "
        devolver += @titrev
        devolver += "\n"
        devolver += @volumen.to_s
        devolver += ","
        devolver += @paginas.to_s
        devolver += ","
        devolver += @fecha
        devolver
    end
end