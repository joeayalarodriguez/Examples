({
	DescargarFormularioInscripcion : function(cmp, event, helper) {
        // window.open("/ADM_InscripcionPregrado_pag?id=a0s3D000000v7VoQAI", "", "width=800,height=1000");
        var action = cmp.get("c.CreacionVerificacionCertificado");
        console.log("clic en el boton ====================>>>>   " + cmp.get("v.FormID"));
        cmp.set("v.Loadingcertifi",'true');
        // Add callback behavior for when response is received
        action.setParams({ IdFormulario : cmp.get("v.FormID") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("retorno succes >>>>>>>>> "+ cmp.get("v.FormID"));
                var saveaction = cmp.get("c.CertificadoInscripcion");
                console.log("Respuesta metodo clase "+saveaction);
                cmp.set("v.Loadingcertifi",'true');
                // Add callback behavior for when response is received
                saveaction.setParams({ IdFormulario : cmp.get("v.FormID") });
                saveaction.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS")
                    {
                        console.log("CertificadoInscripcion retorno succes >>>>>>>>> "+ state);
                        // cmp.set('v.CuentaID',response.getReturnValue());
                        var contentType = contentType || '';
                        var sliceSize = sliceSize || 512;
                        var zip = new JSZip();
                        var pdfFile = 'Certificado de inscripción';
                        var b64Data = response.getReturnValue();
                                var byteCharacters = atob(b64Data);
                                var byteArrays = [];

                                  for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
                                    var slice = byteCharacters.slice(offset, offset + sliceSize);

                                    var byteNumbers = new Array(slice.length);
                                    for (var i = 0; i < slice.length; i++) {
                                      byteNumbers[i] = slice.charCodeAt(i);
                                    }

                                    var byteArray = new Uint8Array(byteNumbers);

                                    byteArrays.push(byteArray);
                                  }
                        

                                  var blob = new Blob(byteArrays, {type: 'application/pdf'});
                                  console.log(" variable blob " + blob); 
                                  var fileURL = URL.createObjectURL(blob);
                                    location.href=fileURL;
                        cmp.set("v.Loadingcertifi",'false');


                            // window.open(fileURL, "_blank", "toolbar=yes,top=500,left=500,width=400,height=400");

                    }
                    else {
                        console.log("Failed with state: " + state);
                        cmp.set("v.Loadingcertifi",'false');

                    }
                });

                // Send action off to be executed
                $A.enqueueAction(saveaction);
            }
            else {
                console.log("Failed with state: " + state);
                cmp.set("v.Loadingcertifi",'false');

            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);
    },
     
    doinit : function(cmp, event, helper) {
        console.log('@@ADM_ProcessContainer_cmp@@ GetCuenta Id doinit');
        
    }
})