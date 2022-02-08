/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACIÓN
* Descripción:      Administra los eventos del objeto oportunidad
* Cambios (Version)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @version   1.0    19/03/2019      Joe Ayala                           Creación de la clase
****************************************************************************************************************/
public class OpportunityHandler_cls {
     
     /* 
    * Nombre: BeforeDelete
    * Descripcion: Metodo que impide le borrado de oportunidades con productos
    * Fecha Creación: 19/03/2019
    * Cambios de Version del Metodo:
    * --------------------------------------------------------------------------------------------------------------
    * Version        Fecha                   Autor                        Descripción
    * ---------     ------------     ----------------------      -----------------------------
    *   1            19-Mar-2019     Joe Ayala Rodriguez              Creacion del metodo.
    * --------------------------------------------------------------------------------------------------------------
    */
    public static void BeforeDelete(list <Opportunity> lstOpportunityld, map<Id,Opportunity> oldmap)
    {
	   for (Opportunity a : [SELECT Id FROM Opportunity
                     	 WHERE Id IN (SELECT OpportunityId  FROM OpportunityLineItem) AND Id IN :lstOpportunityld]) 
       {
        	oldmap.get(a.Id).addError(
            'No se permite el borrado de Oportunidades con Productos');
       }   	 
    }
}