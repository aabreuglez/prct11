# encoding: UTF-8
class ArtPer < Bibliography
    #attr_reader :autor, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    attr_reader :diario, :lugar, :paginacion, :columna 
    def initialize(*args) 
        raise unless args.length == 7
        @autor = args[0]
        @titulo = args[1]
        @diario = args[2]
        @lugar = args[3]
        @fecha = args[4]
        @paginacion = args[5]
        @columna = args[6]
    end
    
    def to_s
        devolver=""
        #("Ramirez,Mojo picon\nEl dia,Tenerife,11 de Noviembre de 2014\nSeccion Nuestra Gente,1")
        for i in @autor do
            devolver += i
            devolver += ","
        end
        devolver += @titulo
        devolver += "\n"
        devolver += @diario
        devolver += ","
        devolver += @lugar
        devolver += ","
        devolver += @fecha
        devolver += "\n"
        devolver += @paginacion
        devolver += ","
        devolver += @columna.to_s
        devolver
    end
end