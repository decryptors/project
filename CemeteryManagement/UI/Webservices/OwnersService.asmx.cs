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
    /// Summary description for OwnersService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class OwnersService : System.Web.Services.WebService
    {
        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private OwnersController _ownerController = new OwnersController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_ownerController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddOwner(Owner owner)
        {
            try
            {
                _ownerController.Add(owner);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string EditOwner(Owner owner)
        {
            try
            {
                _ownerController.Update(owner);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string ReadOwnerByID(int personId)
        {
            try
            {
               
                return JsonConvert.SerializeObject(_ownerController.ReadById(personId), Formatting.None, new JsonSerializerSettings());
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
