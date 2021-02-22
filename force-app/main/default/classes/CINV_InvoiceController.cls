public with sharing class CINV_InvoiceController {
    public Invoice__c invoice {get;set;}
    public Invoice__c currentnvoice {get;set;}
    public CINV_InvoiceController(ApexPages.StandardController controller) {
        invoice=(Invoice__c)controller.getRecord();
        invoice=[select id,name,date__c,Bill_To__r.name,Bill_To__r.BillingStreet,Bill_To__r.BillingCity
        ,Bill_To__r.BillingCountry,Bill_To__r.BillingPostalCode,Bill_To__r.Phone,days__c,Bill_To__r.Id
        ,AMOUNT__c,Unit_price__c,description__c
        ,tax_rate__c,tax__c,total__c,Bank_Account__r.name
        
         from Invoice__c where id=:invoice.id];

         currentnvoice=[select id,name
        
         from Invoice__c where id=:invoice.id];
         


    }

          //HKA 09.12.2020 redirect and save the PDf in file Object [Bon de livraison]
          Public PageReference SaveInvoice(){
            PageReference retURL;
    
         
    
                if( ApexPages.currentPage().getParameters().containsKey('uploadMode')) return null;
    
                PageReference PDFExportedPage = new PageReference('/apex/CINV_InvoicePage1?id='+ ApexPages.currentPage().getParameters().get('id')+'&uploadMode=true');
        
                Blob pdfContent = blob.valueOf('Unit.Test');
                
                pdfContent = PDFExportedPage.getContentAsPDF();
                
        
                ContentVersion ContVerFile = new ContentVersion();
                ContVerFile.VersionData = pdfContent;
                ContVerFile.Title =currentnvoice.Name; 
                ContVerFile.ContentLocation= 's';
                ContVerFile.PathOnClient=currentnvoice+'.pdf';
        
                insert ContVerFile;
        
                Id PDFcontentDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:ContVerFile.Id].ContentDocumentId;
                ContentDocumentLink InvoicePDF = new ContentDocumentLink();
                InvoicePDF.ContentDocumentId = PDFcontentDoc;
                InvoicePDF.LinkedEntityId = ApexPages.currentPage().getParameters().get('id');
                InvoicePDF.ShareType = 'I';
                InvoicePDF.Visibility = 'AllUsers';
        
                insert InvoicePDF;
           
    
    
            return retURL;
        }
}
