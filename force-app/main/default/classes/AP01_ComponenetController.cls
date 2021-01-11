public class AP01_ComponenetController {

    public String getLogin() {
        return null;
    }


    public String login { get; set; }

    public String getUsername() {
        return null;
    }
    public String getPassword() {
        return null;
    }


 public String username { get; set; }
public String password {get; set;}
public String controllerValue;


public void setControllerValue (String s){
controllerValue = s.toUpperCase();
}

public string getControllerValue(){
return controllerValue;
}


public PageReference login() {
    PageReference page =new PageReference('https://cs16.salesforce.com/?un='+username+'&pw='+password+'&startURL=/home/home.jsp');

      //  String startUrl = System.currentPageReference().getParameters().get('startURL');
      //  return Site.login(username, password, startUrl);
      return page;
    }

}