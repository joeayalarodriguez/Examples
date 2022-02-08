({
	handleClick : function(cmp, evt, help) {
		var StrNombreapp = cmp.get('v.StrNombre');
        var StrApellidoapp = cmp.get('v.StrApellido');
        var elemento = cmp.find("Apellidofld");
        if(StrNombreapp == 'Joseph')
        {
            elemento.set("v.disabled",true);
        }
        else
        {
            elemento.set("v.disabled",false);
        }
        help.helperMethod(cmp,evt,help,StrNombreapp);
	},
    ObtenerNombre : function(cmp, evt, help) {
		var action = cmp.get("c.EnvioNombre");
        	

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                cmp.set("v.StrNombre", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);
	}
})