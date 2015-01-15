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
    /// Summary description for ContractService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ContractService : System.Web.Services.WebService
    {
        private JavaScriptSerializer _serializer = new JavaScriptSerializer();
        private ContractController _contractController = new ContractController();

        [WebMethod]
        public string ReadAll()
        {
            return JsonConvert.SerializeObject(_contractController.ReadAll(), Formatting.None, new JsonSerializerSettings());
        }

        [WebMethod]
        public string AddContract(Contract contract, int personId)
        {
            try
            {
                _contractController.Add(contract, personId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string EditContract(Contract contract, int personId)
        {
            try
            {
                _contractController.Update(contract, personId);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string ReadContractById(int contractId)
        {
            try
            {
                return JsonConvert.SerializeObject(_contractController.ReadById(contractId), Formatting.None, new JsonSerializerSettings());
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
        [WebMethod]
        public string DeleteContractById(Contract contract)
        {
            try
            {
                _contractController.Delete(contract);
                return "true";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
