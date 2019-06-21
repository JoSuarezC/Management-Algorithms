note
	description: "Summary description for {OBJETO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OBJETO
create
	inicializar

feature {NONE}-- Variables

	tamano: INTEGER
	identificador: INTEGER


feature
	inicializar(id: INTEGER; size: INTEGER)
		do
			tamano := size
			identificador := id
		end

feature
	get_tamano: INTEGER
	do
		Result := tamano
	end

feature
	get_id: INTEGER
	do
		Result := identificador
	end


end
