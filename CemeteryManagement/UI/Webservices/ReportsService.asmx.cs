using Controller;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace UI
{
    /// <summary>
    /// Summary description for ReportsService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class ReportsService : System.Web.Services.WebService
    {
        private ReportsController _reportsController = new ReportsController();

        [WebMethod]
        public string ReadAllRegG()
        {
            return JsonConvert.SerializeObject(_reportsController.ReadAllRegG(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string ReadAllRegE()
        {
            return JsonConvert.SerializeObject(_reportsController.ReadAllRegE(), Formatting.None, new JsonSerializerSettings());
        }

         [WebMethod]
        public string ReadAllRegD()
        {
            return JsonConvert.SerializeObject(_reportsController.ReadAllRegD(), Formatting.None, new JsonSerializerSettings());
        }

         [WebMethod]
        public string ReadAllRegC()
        {
            return JsonConvert.SerializeObject(_reportsController.ReadAllRegC(), Formatting.None, new JsonSerializerSettings());
        }
    }
}
