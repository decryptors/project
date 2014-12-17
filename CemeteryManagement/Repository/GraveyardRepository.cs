using Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class GraveyardRepository 
    {
        private const string READ_ALL_GRAVEYARDS = "ReadAllGraveyards";
        private const string ADD_GRAVEYARD = "AddGraveyard";
        private const string DELETE_GRAVEYARD = "DeleteGraveyard";
        private const string UPDATE_GRAVEYARD = "UpdateGraveyard";
        private const string READ_GRAVEYARD_BY_ID = "ReadGraveyardById";
        public GraveyardRepository()
        {
            
        }


        public List<Graveyard> ReadAllGraveyards()
        {
            return DBManager.ExecuteReadCommand<Graveyard>(READ_ALL_GRAVEYARDS, ReaderToModel);
        }

        public Graveyard ReadByID(int id)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = id }
            };
            return DBManager.ExecuteReadCommand<Graveyard>(READ_GRAVEYARD_BY_ID, ReaderToModel, param).FirstOrDefault();
        }

        public void AddGraveyard(Graveyard graveyard)
        {
            SqlParameter[] param = {
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = graveyard.Name },
                new SqlParameter("@Address", SqlDbType.NVarChar, -1) { Value = graveyard.Address }    
            };

            DBManager.ExecuteCommand(ADD_GRAVEYARD, param);
        }

        public void DeleteGraveyard(Graveyard graveyard)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value =graveyard.GraveyardId }
            };
            DBManager.ExecuteCommand(DELETE_GRAVEYARD, param);
        }

        public void UpdateGraveyard(Graveyard graveyard)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = graveyard.GraveyardId },
                new SqlParameter("@Name", SqlDbType.NVarChar, -1) { Value = graveyard.Name },
                new SqlParameter("@Address", SqlDbType.NVarChar, -1) { Value = graveyard.Address }
                
            };

            DBManager.ExecuteCommand(UPDATE_GRAVEYARD, param);
        }

        private Graveyard ReaderToModel(SqlDataReader reader)
        {
            return new Graveyard
            {
                GraveyardId = reader.GetInt32(reader.GetOrdinal("GraveyardId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Address = reader.GetString(reader.GetOrdinal("Address"))
                
            };
        } 
    }
}
