({
	doInit : function(component, event, helper) {

		
		var urlid = component.get("v.recordId");
		var URLinv = '/apex/CINV_InvoicePage1?id='+urlid;
		console.log('i am here '+URLinv );
		component.set('v.urlinvoice', URLinv);
      
    }
})