using Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class OwnerRepository
    {
        private const string READ_ALL_OWNERS = "Owners_ReadAllOwners";
        private const string ADD_OWNERS = "AddOwners";
        private const string DELETE_OWNERS = "DeleteOwners";
        private const string UPDATE_OWNERS = "UpdateOwners";
        private const string READ_OWNERS_BY_PERSONID = "ReadByIDOwners";

        public OwnerRepository()
        {
            
        }

        public List<Owner> ReadAll()
        {
            return DBManager.ExecuteReadCommand<Owner>(READ_ALL_OWNERS, ReaderToModel);
        }

        public Owner ReadByID(int id) {
            SqlParameter[] ownerParam = {
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = id }
            };
            return DBManager.ExecuteReadCommand<Owner>(READ_OWNERS_BY_PERSONID, ReaderToModel, ownerParam).FirstOrDefault();
        }

        public void AddOwner(Owner owner) {
            SqlParameter[] ownerParam = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = owner.Name },
                new SqlParameter("@Address", SqlDbType.NVarChar, -1) { Value = owner.Address }
            };

            DBManager.ExecuteCommand(ADD_OWNERS, ownerParam);
        }

        public void DeleteOwner(Owner owner) {
            SqlParameter[] ownerParam = {
                new SqlParameter("@PersonID", SqlDbType.Int) { Value = owner.PersonId }
            };
            DBManager.ExecuteCommand(DELETE_OWNERS, ownerParam);
        }

        public void UpdateOwner(Owner owner) {
            SqlParameter[] ownerParam = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = owner.Name },
                new SqlParameter("@Address", SqlDbType.NVarChar, -1) { Value = owner.Address }
            };
            DBManager.ExecuteCommand(UPDATE_OWNERS, ownerParam);
        }

        protected  Owner ReaderToModel(SqlDataReader reader)
        {

            return new Owner
            {
                PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Address = reader.GetString(reader.GetOrdinal("Address"))
            };
        } 
    }
}
