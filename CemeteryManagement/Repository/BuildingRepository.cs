using Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class BuildingRepository
    {
        #region String Constants
        private const string READ_ALL_BUILDINGS = "ReadAllBuildings";
        private const string ADD_BUILDING = "AddBuilding";
        private const string DELETE_BUILDING = "DeleteBuilding";
        private const string UPDATE_BUILDING = "UpdateBuilding";
        private const string READ_BUILDING_BY_ID = "GetBuildingById";
        #endregion

        public BuildingRepository()
        {
            
        }

        public List<Building> ReadAllBuildings()
        {
            return DBManager.ExecuteReadCommand<Building>(READ_ALL_BUILDINGS, ReaderToModel);
        }

        public Building ReadByID(int id)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = id }
            };
            return DBManager.ExecuteReadCommand<Building>(READ_BUILDING_BY_ID, ReaderToModel, param).FirstOrDefault();
        }

        public void AddBuilding(Building building,int areaId)
        {
            SqlParameter[] param = {
                new SqlParameter("@Type", SqlDbType.NVarChar, -1) { Value = building.Type },
                new SqlParameter("@isHistorical", SqlDbType.Bit, -1) { Value = building.IsHistorical },
                new SqlParameter("@areaId", SqlDbType.Int) { Value = areaId }
                
            };

            DBManager.ExecuteCommand(ADD_BUILDING, param);
        }

        public void DeleteBuilding(Building building)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value =building.BuildingId }
            };
            DBManager.ExecuteCommand(DELETE_BUILDING, param);
        }

        public void UpdateBuilding(Building building,int areaId)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = building.BuildingId },
                new SqlParameter("@Type", SqlDbType.NVarChar, -1) { Value = building.Type },
                new SqlParameter("@isHistorical", SqlDbType.Bit, -1) { Value = building.IsHistorical },
                new SqlParameter("@areaId", SqlDbType.Int) { Value = areaId }
            };

            DBManager.ExecuteCommand(UPDATE_BUILDING, param);
        }

        private Building ReaderToModel(SqlDataReader reader)
        {

            return new Building
            {
                BuildingId = reader.GetInt32(reader.GetOrdinal("BuildingId")),
                Type = reader.GetString(reader.GetOrdinal("Type")),
                IsHistorical = reader.GetBoolean(reader.GetOrdinal("isHistorical"))
            };
        }
        
    }
}
