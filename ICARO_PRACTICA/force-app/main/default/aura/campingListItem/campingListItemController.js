({ 
    packItem: function (component, event, helper) { 
        var a = componente.get ("v.item", true); 
        a.Packed__c = true; 
        component.set ("V.item", a); 
        var btnClicked = event.getSource (); 
        btnClicked.set ("v.disabled", true); 
    } 
})