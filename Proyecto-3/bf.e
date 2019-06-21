
class
	BF

inherit
	FIT
		redefine procesar end

create
	inicializar


feature
	procesar
		local
			iOb: INTEGER
			caja: CAJA
		do
			crearCaja
			from iOb := 1
			until iOb > secuenciaObjetos.count
			loop
				caja := seleccionarCaja(secuenciaObjetos.i_th(iOb).get_tamano)
				caja.agregarobjeto (secuenciaObjetos.i_th(iOb))
				iOb := iOb + 1
			end

		end


feature {NONE}
	seleccionarCaja(tamanoObjeto: INTEGER): CAJA
		local
			indCaja: INTEGER
			indCandidata: INTEGER
			tamanoCandidata: INTEGER
			caja: CAJA
		do
			tamanoCandidata := get_arrayCajas.i_th(1).get_espaciodisponible
			indCandidata := 0

			from indCaja := 1
			until indCaja > get_arrayCajas.count
			loop
				if (get_arrayCajas.i_th(indCaja).get_espacioDisponible >= tamanoObjeto) and (get_arrayCajas.i_th(indCaja).get_espacioDisponible <= tamanoCandidata) then
					indCandidata := indCaja
					tamanoCandidata := get_arrayCajas.i_th(indCaja).get_espacioDisponible
					indCaja := indCaja + 1
				else
					indCaja := indCaja + 1
				end
			end

			if (indCandidata = 0) then
				crearCaja
				caja := get_arrayCajas.i_th (get_arrayCajas.count)
			else caja := get_arrayCajas.i_th(indCandidata)
			end

			Result := caja
		end

end -- Final BF
