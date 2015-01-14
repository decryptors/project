<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/LoginForm.aspx.cs" MasterPageFile="~/Forms/LoginTemplate.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">
    <script type="text/javascript">
        function Login() {            
            var credentials = new Object();
            credentials.Name = $("#inputName").val();
            credentials.Password = $("#inputPassword").val();            
            var obj = JSON.stringify({ credentials: credentials });
            $.ajax({
                type: "POST",
                url: "/Webservices/LoginService.asmx/Login",
                data: obj,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var response = JSON.parse(data.d);
                    if (response.valid == "true") {
                        document.location.replace("/Forms/DeceasedForm.aspx");
                    } else {
                        $("#wrongPassword").show();
                    }
                },
                error: function (err, msg) {
                    $("#wrongPassword").show();
                }

            });            
        }
    </script>
        <div id="loginFormContainer">
            <h4>Managementul cimitirelor</h4><br />
            
             <input class="form-control" id="inputName" type="text" name="name" placeholder="Nume" /><br />
             <input class="form-control" id="inputPassword" type="password" name="password" placeholder="Parola" /><br />             
             <button class="btn btn-default" onclick="Login(); return false;">Login</button> <br />                      
            <span id="wrongPassword" style="display: none">* Numele sau parola sunt greșite.<br /></span>                           
        </div>

    
</asp:Content>

