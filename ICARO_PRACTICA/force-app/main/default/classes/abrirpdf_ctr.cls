global class abrirpdf_ctr {
    @AuraEnabled
    global static String CreacionVerificacionCertificado(String IdFormulario)
    {
        system.debug('Ingresa a la clase apex CreacionVerificacionCertificado ===>>> '+ IdFormulario);
        Account objcuenta = [SELECT LastModifiedById,Name FROM Account where Id =: IdFormulario];
        if(objcuenta == null)
        {
             Account cuenta = new Account(Name='cuenta1');   
           
             Insert cuenta;
            return cuenta.Id;
        }
        else
        {
            system.debug('Retornando cuenta ===>>> '+ objcuenta.Id);
            return objcuenta.Id;
        }
    }
    
    @AuraEnabled
    global static String CertificadoInscripcion(String IdFormulario)
    {
        Blob pdfBody;
        String strpdf = '';
		System.debug('IdFormulario___>>>>> '+IdFormulario); 
        
        if(1==2)
        {
            strpdf = '';
			/*
             PageReference authorizationForm = Page.ADM_InscripcionPregrado_pag; 
             authorizationForm.getParameters().put('id',IdFormulario);
             //authorizationForm.addHeader('Content-Type', 'application/pdf');                
             if(!Test.IsRunningTest()){ pdfBody = authorizationForm.getContentAsPdf(); } else { pdfBody = Blob.valueOf('UNIT.TEST'); }            
          
            
            Attachment attachment = new Attachment();
              attachment.Body = pdfBody;
              attachment.Name = 'Certificado de inscripción.pdf';
              attachment.ParentId = IdFormulario; 
              insert attachment;

              ADM_CertificadoInscripcion__c Certificado = new ADM_CertificadoInscripcion__c();
              Certificado.Id = SolicitudInscripcion.SolicitudInscripcion__r[0].Id;
             Certificado.ADM_IdDocumento__c = attachment.Id;
             update Certificado;
            return EncodingUtil.base64Encode(pdfBody);
			*/
        }
        else
        {
            System.debug('buscara el adjunto atado a la cuenta ?? >>>>> '+IdFormulario); 
            ContentVersion Adjuntos = [SELECT VersionData FROM ContentVersion WHERE FirstPublishLocationId =: IdFormulario /*AND ContentDocumentId = '06946000004SvumAAC' */AND IsLatest = true order by VersionNumber desc limit 1];
            strpdf = EncodingUtil.base64Encode(Adjuntos.VersionData);
            System.debug('ingreso por el else >>>>> '+strpdf); 

        }


//Blob pdf = new PageReference('/apex/authorizationForm').getContentAsPDF();
     return strpdf;
        
    }
    
    
}