using Controller;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace UI.Webservices
{
    /// <summary>
    /// Summary description for AreaService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AreaService : System.Web.Services.WebService
    {

        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private AreaController _areaController = new AreaController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_areaController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

       

        [WebMethod]
        public string AddArea(Area area,int contractId)
        {
            try
            {
                _areaController.Add(area, contractId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string EditArea(Area area, int contractId)
        {
            try
            {
                _areaController.Update(area, contractId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string ReadDeceasedById(int personId)
        {
            try
            {
                return JsonConvert.SerializeObject(_areaController.ReadById(personId), Formatting.None, new JsonSerializerSettings());
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
