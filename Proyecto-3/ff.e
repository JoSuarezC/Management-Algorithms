note
	description: "Summary description for {OBJETO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FF

inherit
	FIT
		redefine procesar end
create
	inicializar

feature
	procesar
		local iCa: INTEGER iOb: INTEGER
		do
			crearCaja
			iCa := 1
			from iOb := 1
			until iOb > secuenciaObjetos.count
			loop
				if get_arrayCajas.i_th (iCa).get_espaciodisponible >= secuenciaObjetos.i_th (iOb).get_tamano then
					get_arrayCajas.i_th (iCa).agregarobjeto (secuenciaObjetos.i_th (iOb)) -- espacioDisponible se esta en agregarObjeto
					iOb := iOb + 1
					iCa := 1
				elseif arrayCajas.count > iCa then
					iCa := iCa + 1
				else
					iCa := iCa + 1
					crearCaja

				end
			end

		end

end -- Final FF
