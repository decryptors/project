using Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
namespace Repository
{
    public class DeceasedRepository
    {
        private const string READ_ALL_DECEASED = "Persons_ReadAllDeceased";
        private const string ADD_DECEASED = "AddDeceased";
        private const string DELETE_DECEASED = "DeleteDeceased";
        private const string UPDATE_DECEASED = "UpdateDeceased";
        public DeceasedRepository()
        {
           
        }
        public List<Deceased> ReadAll()
        {
            return DBManager.ExecuteReadCommand<Deceased>(READ_ALL_DECEASED, ReaderToModel);
        }

        public void AddDeceased(Deceased deceased) {
            SqlParameter[] deceasedParam = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = deceased.Name },
                new SqlParameter("@Religion", SqlDbType.NVarChar, -1) { Value = deceased.Religion },
                new SqlParameter("@DateOfBurial", SqlDbType.Date) { Value = deceased.DateOfBurial },
                new SqlParameter("@isVip", SqlDbType.Bit) { Value = deceased.IsVIP },
                new SqlParameter("@BurialCertificateNumber", SqlDbType.NVarChar, -1) { Value = deceased.BurialCertificateNumber }
            };

            DBManager.ExecuteCommand(ADD_DECEASED, deceasedParam);
        }

        public void DeleteDeceased(Deceased deceased) {
            SqlParameter[] deceasedParam = {
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = deceased.PersonId }
            };
            DBManager.ExecuteCommand(DELETE_DECEASED, deceasedParam);
        }

        public void UpdateDeceased(Deceased deceased) {
            SqlParameter[] deceasedParam = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = deceased.Name },
                new SqlParameter("@Religion", SqlDbType.NVarChar, -1) { Value = deceased.Religion },
                new SqlParameter("@DateOfBurial", SqlDbType.Date) { Value = deceased.DateOfBurial },
                new SqlParameter("@isVip", SqlDbType.Bit) { Value = deceased.IsVIP },
                new SqlParameter("@BurialCertificateNumber", SqlDbType.NVarChar, -1) { Value = deceased.BurialCertificateNumber }
            };
            DBManager.ExecuteCommand(UPDATE_DECEASED, deceasedParam);
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
                BurialCertificateNumber = reader.GetString(reader.GetOrdinal("BurialCertificateNumber"))
            };
        } 
    }
}
