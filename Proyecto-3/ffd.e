note
	description: "Summary description for {OBJETO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FFD

inherit
	FF
		redefine inicializar
		end

create
	inicializar


feature
	inicializar(ao: LINKED_LIST[OBJETO]; tC: INTEGER)
		do
			create secuenciaObjetos.make
			create arrayCajas.make
			secuenciaObjetos := ao
			idCaja := 1001
			tamanoCaja := tC
			crearCaja
			ordenarSecuencia
		end

feature {NONE}
	ordenarSecuencia
		local
			indAgregado: INTEGER
			indCandidato: INTEGER
			indOpositor: INTEGER
			temp: OBJETO
		do
			from indAgregado := 1
			until indAgregado > secuenciaObjetos.count
			loop
				indCandidato := indAgregado
				from indOpositor := indCandidato + 1
				until indOpositor > secuenciaObjetos.count
				loop
					if secuenciaObjetos.i_th(indCandidato).get_tamano >= secuenciaObjetos.i_th(indOpositor).get_tamano then
						indOpositor := indOpositor + 1
					else
						indCandidato := indOpositor
						indOpositor := indOpositor + 1
					end
				end

				temp := secuenciaObjetos.i_th(indAgregado)
				secuenciaObjetos.put_i_th(secuenciaObjetos.i_th(indCandidato), indAgregado)
				secuenciaObjetos.put_i_th(temp, indCandidato)
				indAgregado := indAgregado + 1
			end
		end




end --Final FFD
