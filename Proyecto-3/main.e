note
	description: "Proyecto 3 del curso Lenguajes de programación"
	date: "$12/6/2018"

class
	MAIN

create
	make

feature {NONE} -- Variables
	idObjeto: INTEGER
	tamanoCajas: INTEGER
	tamanoObjeto: INTEGER
	tamanoSemilla: INTEGER
	cantidadObjetos: INTEGER
	secuenciaObjetos: LINKED_LIST[OBJETO]
	AlgoritmoFF: FF
	AlgoritmoFFD: FFD
	AlgoritmoBF: BF

feature  -- Initialization
	make
		do

			idObjeto := 1
			create secuenciaObjetos.make
			print("Definir parametros para la simulacion%N")
			print("%N")
			print("Indique los datos solicitados, en caso contrario presione -1 para que se asigne el valor por defecto.%N")
			print("%N")

			indicar_tamano_cajas
			indicar_tamano_objetos
			indicar_tamano_semilla
			indicar_cantidad_objetos

			print("%N")
			generar_objetos

			-- Mostrados
			mostrarDatosGenerales
			mostrarObjetos

			ejecutarAlgoritmos

		end

feature
	mostrarDatosGenerales
		local
			suma: INTEGER
			i: INTEGER
		do
			print("%N")
			print("%N")
			print("Datos generales: %N")
			print("- Tamano de las cajas: ")
			print(tamanoCajas)
			print("%N")
			print("- Tamano maximo de los objetos: ")
			print(tamanoObjeto)
			print("%N")
			print("- Semilla: ")
			print(tamanoSemilla)
			print("%N")
			print("- Cantidad de objetos generados: ")
			print(secuenciaObjetos.count)
			print("%N")
			print("- Suma del tamano de los objetos: ")

			suma := 0
			from i := 1
			until i > secuenciaObjetos.count
			loop
				suma := suma + secuenciaObjetos.i_th (i).get_tamano
				i:=i+1
			end
			print(suma)
			print("%N")
			print("%N")
		end

feature
	mostrarObjetos
		local
			i: INTEGER
		do
			print("Listado de objetos: (Identificador, tamano) %N")
			from i := 1
			until i > secuenciaObjetos.count
			loop
				print("(")
				print(secuenciaObjetos.i_th (i).get_id)
				print(", ")
				print(secuenciaObjetos.i_th (i).get_tamano)
				print(") ")

				if i = 40 then
					print("...")
					i := secuenciaObjetos.count + 1
				end

				if i \\ 10 = 0 then
					print("%N")
				end

				i := i + 1

			end
			print("%N")
			print("%N")
		end

feature {NONE}
	ejecutarAlgoritmos
		do

			create AlgoritmoFF.inicializar (secuenciaObjetos, tamanoCajas)
			create AlgoritmoFFD.inicializar(secuenciaObjetos, tamanoCajas)
			create AlgoritmoBF.inicializar (secuenciaObjetos, tamanoCajas)
			print("-------------------------------Ejecutando el algoritmo First Fit------------------------------- %N")
			AlgoritmoFF.procesar
			AlgoritmoFF.mostrarResultado

			print("%N")
			print("%N")
			print("--------------------------Ejecutando el algoritmo First Fit Decreasing------------------------- %N")
			AlgoritmoFFD.inicializar (secuenciaObjetos, tamanoCajas)
			AlgoritmoFFD.procesar
			AlgoritmoFFD.mostrarResultado

			print("%N")
			print("%N")
			print("-------------------------------Ejecutando el algoritmo Best Fit-------------------------------- %N")
			AlgoritmoBF.inicializar (secuenciaObjetos, tamanoCajas)
			AlgoritmoBF.procesar
			AlgoritmoBF.mostrarResultado
		end

feature {NONE}-- Obtener datos consola
	obtener_entrada_usuario: INTEGER
		do
			Io.new_line
			Io.read_integer

			Result := Io.last_integer
		end


feature {NONE}-- Tamaño cajas
	indicar_tamano_cajas
		local
			i: INTEGER
		do
			from i:=0
			until i > 0
			loop
				print("Indique el tamano de cajas deseado%N")
				tamanoCajas := obtener_entrada_usuario
				if tamanoCajas > 0 then
					print("Se ha asignado el valor dado%N")
					i := i + 1
				elseif tamanoCajas = -1 then
					tamanoCajas := 10
					print ("Se ha asignado el valor por defecto%N")
					i:= i + 1
				else print("Error! Indique un valor valido%N")
				end
			end

		end

feature {NONE}-- Tamaño objetos
	indicar_tamano_objetos
	local
		i: INTEGER
	do
		from i:=0
		until i > 0
		loop
			print("Indique el tamano maximo de los objetos %N")
			tamanoObjeto := obtener_entrada_usuario
			if tamanoObjeto > 1 then
				if tamanoObjeto < tamanoCajas then
					print("Se ha asignado el valor dado %N")
					i := i + 1
				else print("Error! Indique un valor menor al tamano de las cajas %N")
				end

			elseif tamanoObjeto = -1 then
				tamanoObjeto := 7
				print ("Se ha asignado el valor por defecto%N")
				i := i + 1
			else print("Error! Indique un valor valido%N")
			end
		end
	end

feature {NONE}-- Tamaño semilla
	indicar_tamano_semilla
	local
		i: INTEGER
	do
		from i:=0
		until i > 0
		loop
			print("Indique el tamano de semilla %N")
			tamanoSemilla := obtener_entrada_usuario
			if tamanoSemilla > 0 then
				print("Se ha asignado el valor dado%N")
				i := i + 1
			elseif tamanoSemilla = -1 then
				tamanoSemilla:=2018
				print ("Se ha asignado el valor por defecto%N")
				i := i + 1
			else print("Indique un valor valido%N")
			end
		end
	end

feature {NONE}-- Cantidad objetos
	indicar_cantidad_objetos
	local
		i: INTEGER
	do
		from i:=0
		until i > 0
		loop
			print("Indique la cantidad de objetos generados%N")
			cantidadObjetos := obtener_entrada_usuario
			if cantidadObjetos > 0 then
				print("Se ha asignado el valor dado%N")
				i := i + 1
			elseif cantidadObjetos = -1 then
				cantidadObjetos :=20
				print ("Se ha asignado el valor por defecto%N")
				i := i + 1
			else print("Indique un valor valido%N")
			end
		end
	end


feature	{NONE}-- generar los objetos para los algoritmos
	generar_objetos
		local
			r: RANDOM
			valor: INTEGER
		do
			across
		        1 |..| cantidadObjetos as ind-- cantidad de numeros a generar, desde |..| hasta
			from
				create r.set_seed(tamanoSemilla) -- establecer la semilla
		        r.start
			loop
				valor := r.item \\ tamanoObjeto + 1 -- definir los rangos de los numeros que se generan (se incluyen los numeros)
				secuenciaObjetos.extend (crearObjeto(valor))
				r.forth
			end

		end


feature {NONE}
	crearObjeto(tamano: INTEGER): OBJETO
		local objeto: OBJETO
		do
			create objeto.inicializar(idObjeto,tamano)
			idObjeto := idObjeto + 1
			Result := objeto
		end

end -- Final main

