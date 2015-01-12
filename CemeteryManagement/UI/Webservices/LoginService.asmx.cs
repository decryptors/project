using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Model;
using Controller;
using Newtonsoft.Json;

namespace UI.Webservices
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        private LoginController _loginController = new LoginController();

        [WebMethod]
        public string Login(Login credentials)
        {
            bool correctLogin = _loginController.CheckUsernamePassword(credentials);

            Dictionary<String, String> jsonData = new Dictionary<string, string>();
            jsonData["valid"] = correctLogin ? "true" : "false";
            return JsonConvert.SerializeObject(jsonData);
        }
    }
}
