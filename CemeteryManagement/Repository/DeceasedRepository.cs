using Model;
using System.Collections.Generic;
using System.Data.SqlClient;
namespace Repository
{
    public class DeceasedRepository
    {
        private const string READ_ALL_DECEASED = "Persons_ReadAllDeceased";
        public DeceasedRepository()
        {
           
        }
        public List<Deceased> ReadAll()
        {
            return DBManager.ExecuteReadCommand<Deceased>(READ_ALL_DECEASED, ReaderToModel);
        }

        protected  Deceased ReaderToModel(SqlDataReader reader)
        {

            return new Deceased
            {
                PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Religion = reader.GetString(reader.GetOrdinal("Religion")),
                DateOfBurial = reader.GetDateTime(reader.GetOrdinal("DateOfBurial")),
                IsVIP = reader.GetBoolean(reader.GetOrdinal("isVip")),
                BurialCertificateNumber = reader.GetInt32(reader.GetOrdinal("BurialCertificateNumber")).ToString()
            };
        } 
    }
}
