using Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class HomelessRepository
    {
        private const string READ_ALL_HOMELESS = "Persons_ReadAllHomeless";
        private const string ADD_HOMELESS = "AddHomeless";
        private const string DELETE_HOMELESS = "DeleteHomeless";
        private const string UPDATE_HOMELESS = "UpdateHomeless";
        private const string READ_HOMELESS_BY_PERSONID = "ReadByIDHomeless";

        public HomelessRepository()
        {
            
        }
          

        public List<Homeless> ReadAll()
        {
            return DBManager.ExecuteReadCommand<Homeless>(READ_ALL_HOMELESS, ReaderToModel);
        }

        public Homeless ReadByID(int id)
        {
            SqlParameter[] homelessParam = {
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = id }
            };
            return DBManager.ExecuteReadCommand<Homeless>(READ_HOMELESS_BY_PERSONID, ReaderToModel, homelessParam).FirstOrDefault();
        }

        public void AddHomeless(Homeless homeless)
        {
            SqlParameter[] homelessParam = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = homeless.Name },
                new SqlParameter("@Religion", SqlDbType.NVarChar, -1) { Value = homeless.Religion },
                new SqlParameter("@DateOfBurial", SqlDbType.Date) { Value = homeless.DateOfBurial },
                new SqlParameter("@isVip", SqlDbType.Bit) { Value = homeless.IsVIP },
                new SqlParameter("@BurialCertificateNumber", SqlDbType.NVarChar, -1) { Value = homeless.BurialCertificateNumber },
                new SqlParameter("@RequestNo", SqlDbType.NVarChar, -1) { Value = homeless.RequestNumber },

            };


            DBManager.ExecuteCommand(ADD_HOMELESS, homelessParam);
        }

        public void DeleteHomeless(Homeless homeless)
        {
            SqlParameter[] homelessParam = {
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = homeless.PersonId }
            };
            DBManager.ExecuteCommand(DELETE_HOMELESS, homelessParam);
        }

        public void UpdateHomeless(Homeless homeless)
        {
            SqlParameter[] homelessParam = {
                 new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = homeless.Name },
                new SqlParameter("@Religion", SqlDbType.NVarChar, -1) { Value = homeless.Religion },
                new SqlParameter("@DateOfBurial", SqlDbType.Date) { Value = homeless.DateOfBurial },
                new SqlParameter("@isVip", SqlDbType.Bit) { Value = homeless.IsVIP },
                new SqlParameter("@BurialCertificateNumber", SqlDbType.NVarChar, -1) { Value = homeless.BurialCertificateNumber },
                new SqlParameter("@RequestNo", SqlDbType.NVarChar, -1) { Value = homeless.RequestNumber },
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = homeless.PersonId }
            };
            DBManager.ExecuteCommand(UPDATE_HOMELESS, homelessParam);
        }

        protected Homeless ReaderToModel(SqlDataReader reader)
        {

            return new Homeless
            {
                PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Religion = reader.GetString(reader.GetOrdinal("Religion")),
                DateOfBurial = reader.GetDateTime(reader.GetOrdinal("DateOfBurial")),
                IsVIP = reader.GetBoolean(reader.GetOrdinal("isVip")),
                BurialCertificateNumber = reader.GetString(reader.GetOrdinal("BurialCertificateNumber")),
                RequestNumber = reader.GetString(reader.GetOrdinal("RequestNo"))
            };
        }
    }
}
