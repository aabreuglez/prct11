class Epub < Bibliography
    attr_reader :lugar,:soporte, :fechaconsulta, :disponibilidad
    def initialize(*args)
        raise unless args.length == 7
        @autor=args[0]
        @titulo=args[1]
        @soporte=args[2]
        @lugar=args[3]
        @fecha=args[4]
        @fechaconsulta=args[5]
        @disponibilidad=args[6]
    end
    
    def to_s
        devolver=""
        for i in @autor do
            devolver += i
            devolver += ","
        end
        devolver += " "
        devolver += @titulo
        devolver += " ["
        devolver += @soporte
        devolver += "], "
        devolver += @lugar
        devolver += ", "
        devolver += @fecha.to_s
        devolver += ", "
        devolver += @fechaconsulta
        devolver += ", "
        devolver += @disponibilidad
        devolver
    end
       #("WOLLSTONECRAFT, M. A vindication of the rights of women [en línea], New York, 1996, 5 mayo 1997, Disponible")
      
       # @epub1 = Epub.new(["WOLLSTONECRAFT"],"M. A vindication of the rights of women","en línea","New York",1996,"5 mayo 1997",
       # "Disponible")
end