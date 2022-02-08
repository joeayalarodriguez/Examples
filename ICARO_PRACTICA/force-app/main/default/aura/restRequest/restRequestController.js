({
    makeRequest : function(component, event, helper) {
        var action = component.get("c.service");
        
        action.setParams({
            path: component.get("v.path"),
            method: component.get("v.method"),
            responseFormat: component.get("v.responseFormat"),
            bodyContent: component.get("v.bodyContent"),
            bodyContentType: component.get("v.bodyContentType")
        });
        
        action.setCallback(this, function(a) {
            component.getEvent("restResponseEvent").setParams({
            	response: a.getReturnValue()
            }).fire(); 
        });
        
        $A.enqueueAction(action);
    }
})