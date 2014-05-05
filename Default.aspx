<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<body>

<form id="form1"  method="post" runat="server">
    User Name: <asp:TextBox id="userName" runat="server" />
    <br>
    Password: <asp:TextBox id="password" runat="server" />
    <br><br>
    <asp:Button runat="server" Text="Submit" />
    <br><br>
    <!--User Name Required Feild Validation-->
    <asp:RequiredFieldValidator
    ControlToValidate="userName"
    Text="The user name field is required!"
    runat="server" /><br>
    <!--Password Required Feild Validation-->
    <asp:RequiredFieldValidator
    ControlToValidate="password"
    Text="The password field is required!"
    runat="server" /><br>
    <!--User Name Validation Expression-->
    <asp:RegularExpressionValidator 
    ControlToValidate="userName"
    runat="server"     
    ErrorMessage="This expression does not validate."      
    ValidationExpression=^[A-Z0-9]{1,5}$ /><br />
    <!--Password Validation Expression-->
    <asp:RegularExpressionValidator 
    ControlToValidate="password"
    runat="server"     
    ErrorMessage="This expression does not validate."      
    ValidationExpression=^[a-zA-Z0-9]{1,10}$ /><br />

</form>

</body>
</html>


<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
  {
      String PasswordRegex = @"^?=.*[A-Z]$";
      if (Regex.IsMatch(password.Text, PasswordRegex))
      {
          Response.Write("Valid Password");
      }
      else
          Response.Write("Invalid Password - One Captitalized Character");
            
    
    if (Request.RequestType == "POST")
    {
        String passwordE = Request.Form["form2"];
        if (System.Text.RegularExpressions.Regex.IsMatch(passwordE, "^[A-Z]{1,10}$")) { }
        else
            Response.Write("Invalid Password - One Captitalized Character");

    }
     
    Regex regex = new Regex(@^(?=.*[A-Z])$);
  }

</script>