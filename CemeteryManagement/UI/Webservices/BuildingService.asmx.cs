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
    /// Summary description for BuildingService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class BuildingService : System.Web.Services.WebService
    {

        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private BuildingController _buildingController = new BuildingController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_buildingController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddBuilding(Building building, int areaId)
        {
            try
            {
                _buildingController.Add(building, areaId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string EditBuilding(Building building, int areaId)
        {
            try
            {
                _buildingController.Update(building, areaId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string ReadBuildingByID(int buildingId)
        {
            try
            {

                return JsonConvert.SerializeObject(_buildingController.ReadByID(buildingId), Formatting.None, new JsonSerializerSettings());
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
