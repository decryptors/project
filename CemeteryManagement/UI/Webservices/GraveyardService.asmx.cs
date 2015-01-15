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
    /// Summary description for GraveyardService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class GraveyardService : System.Web.Services.WebService
    {
        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private GraveyardController _graveyardController = new GraveyardController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_graveyardController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddGraveyard(Graveyard graveyard)
        {
            try
            {
                _graveyardController.Add(graveyard);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string EditGraveyard(Graveyard graveyard)
        {
            try
            {
                _graveyardController.Update(graveyard);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string DeleteGraveyard(Graveyard graveyard)
        {
            try
            {
                _graveyardController.Delete(graveyard);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string ReadGraveyardById(int graveyardId)
        {
            try
            {
                return JsonConvert.SerializeObject(_graveyardController.ReadById(graveyardId), Formatting.None, new JsonSerializerSettings());
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
