({
	showModal : function(component, event, helper) {
        component.set("v.message", "Message from Lightning App");
        component.set("v.modalHeading", "Custom Heading");
        
        component.find('modal').openModal();
        //To call this from LWC
        //this.template.querySelector('c-lwc-modal').play();
    }
})