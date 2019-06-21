note
	description: "Summary description for {OBJETO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIT

create
	inicializar


feature {NONE}-- Variables
	secuenciaObjetos: LINKED_LIST[OBJETO]
	arrayCajas: LINKED_LIST[CAJA]
	idCaja: INTEGER
	tamanoCaja: INTEGER


--------------------------ArrayCajas-----------------------------------------------------------------------

feature
	agregarCajaArray(x: CAJA)
		do
			arrayCajas.extend(x)
		end


feature
	get_arrayCajas: LINKED_LIST[CAJA]
		do
			Result := arrayCajas
		end


feature
	inicializar(ao: LINKED_LIST[OBJETO]; tC: INTEGER)
		do
			create secuenciaObjetos.make
			create arrayCajas.make
			secuenciaObjetos := ao
			idCaja := 1001
			tamanoCaja := tC
		end


feature
	procesar
		do


		end


feature {NONE}
	crearCaja
		local caja: CAJA
		do
			create caja.inicializar(idCaja,tamanoCaja)
			idCaja := idCaja + 1
			agregarCajaArray(caja)
		end

feature
	mostrarResultado
	local i: INTEGER promedio: DOUBLE objetosTotal: INTEGER
	do
		from i:=1

		until i > get_arrayCajas.count

		loop
			get_arrayCajas.i_th (i).mostrarcontenido
			objetosTotal := objetosTotal + get_arrayCajas.i_th (i).get_tamanoObjetosTotal
			print("%N")
			i := i + 1
		end
		print("%N")
		print("Cantidad de cajas utilizadas: ")
		print(i-1)
		print("%N")

		print("Promedio de ocupacion: ")
		promedio := objetosTotal / ((i-1) * tamanoCaja)	--suma_tamaños_todos_objetos / (número_cajas * tamaño_caja)
		print(promedio)
		print("%N")
	end

end
