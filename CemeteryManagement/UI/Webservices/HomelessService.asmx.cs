using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using Controller;
using Newtonsoft.Json;
using Model;

namespace UI.Webservices
{
    /// <summary>
    /// Summary description for HomelessService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class HomelessService : System.Web.Services.WebService
    {
        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private HomelessController _homelessController = new HomelessController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_homelessController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddHomeless(Homeless homeless)
        {
            try
            {
                _homelessController.Add(homeless);
                Dictionary<String, String> jsonData = new Dictionary<string, string>();
                jsonData["message"] = "true";
                return JsonConvert.SerializeObject(jsonData);
            }
            catch (Exception exception)
            {
                Dictionary<String, String> jsonData = new Dictionary<string, string>();
                jsonData["message"] = exception.Message;
                return JsonConvert.SerializeObject(jsonData);
            }
        }

        [WebMethod]
        public string EditHomeless(Homeless homeless)
        {
            try
            {
                _homelessController.Update(homeless);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        [WebMethod]
        public string DeleteHomeless(Homeless homeless)
        {
            try
            {
                _homelessController.Delete(homeless);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }


    }
}
