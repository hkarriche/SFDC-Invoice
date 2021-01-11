public with sharing class AP05_Formulaire_Demande_Service {
    //HAM 09-10-2012 création du controleur de la page VFP_15_DemandeService
   
   public blob Attach {get;set;}              //déclaration de la variable qui va contenir le fichier (.docx) à joindre
   public  Lead weblead { get; set; }
   
    // Affectation des valeurs par défaut aux variables du formulaire
    public AP05_Formulaire_Demande_Service(ApexPages.StandardController controller) {
     weblead = new Lead();
   weblead.FirstName = 'Nom*';
   weblead.LastName = 'Prénom*';
   weblead.Email = 'Email*';
   weblead.Phone = 'Téléphone*';
   weblead.Description = 'Un mot sur votre projet*';
   weblead.Company = 'Société*';
    }
     public String getLead() {
        return null;
    }

  // la méthode qui permet d'insérer un lead
  public PageReference saveLead() {
      try {  
       insert(weblead);
       if(Attach!=null)
       {
       AttachNewFile();
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Message envoyé');
       ApexPages.addMessage(myMsg);
       }
       else
       {ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Message envoyé sans une pièce jointe');
       ApexPages.addMessage(myMsg);
       }
       }
       catch(System.DMLException e) {
       }
      return null;

    }
   // HAM 10-10-2012 la méthode qui permet d'attacher une pièce jointe au lead  
   public void AttachNewFile()
    {string CurrentId ;
     CurrentId = weblead.Id;
        try
        {
        Blob b = Attach;
        Attachment At = new Attachment(Name ='Demande_De_Service'+'.docx',body = b,parentId=CurrentId);
        insert At; 
        } 
        Catch(Exception ee){}
       
    }
 //HAM 10-14-2012 la méthode du teste 
 static testMethod void myUnitTest() {
 ApexPages.StandardController controller;
 AP05_Formulaire_Demande_Service Formulaire=new  AP05_Formulaire_Demande_Service(controller);
 Formulaire.saveLead();
 Formulaire.AttachNewFile();
 Formulaire.getLead();
            
 }  
  

}