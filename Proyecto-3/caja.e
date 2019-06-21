note
	description: "Summary description for {CAJA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAJA

create
	inicializar

	feature {NONE} -- Variables
		tamano: INTEGER
		espacioDisponible: INTEGER
		identificador: INTEGER
		listaContenido: LINKED_LIST[OBJETO]

	feature
		agregarObjeto(x: OBJETO)
			do
				listaContenido.extend (x)
				espacioDisponible := espacioDisponible - x.get_tamano
			end

	feature
		inicializar(id: INTEGER; size: INTEGER)
			do
				create listaContenido.make
				tamano := size
				espacioDisponible := size
				identificador := id
			end

	feature
		get_tamanoObjetosTotal: INTEGER
		local suma: INTEGER i: INTEGER
		do
			from i := 1
			until i > listaContenido.count
			loop
				suma := suma + listaContenido.i_th (i).get_tamano
				i := i + 1
			end
			Result := suma
		end
		
	feature
		get_tamano: INTEGER
		do
			Result := tamano
		end

	feature
		get_espacioDisponible: INTEGER
		do
			Result := espacioDisponible
		end

	feature
		get_id: INTEGER
		do
			Result := identificador
		end

	feature
		get_contenido: LINKED_LIST[OBJETO]
		do
			Result := listaContenido
		end

	feature
		mostrarContenido
		local i: INTEGER
		do
			print(identificador)
			print(": ")
			print("[ ")
			from i := 1

			until i > listaContenido.count

			loop
				print("(")
				print(listaContenido.i_th(i).get_id)
				print(", ")
				print(listaContenido.i_th (i).get_tamano)
				print(") ")

				if i = 10 then
					print("...")
					i := listaContenido.count
				end

				i := i + 1

			end
			print(" ]")
		end
end
