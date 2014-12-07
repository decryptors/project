using Controller;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using Newtonsoft.Json;

namespace UI.Webservices
{
    /// <summary>
    /// Summary description for DeceasedService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class DeceasedService : System.Web.Services.WebService
    {
        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private DeceasedController _deceasedController = new DeceasedController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_deceasedController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddDeceased(Deceased deceased)
        {
            try
            {
                _deceasedController.AddDeceased(deceased);
                return "true";
            }
            catch (Exception exception) {
                return exception.Message;
            }
        }
    }
}
