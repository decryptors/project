using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class AreaRepository
    {
        #region String Constants
        private const string READ_ALL_AREAS_WITHOUT_FKS = "ReadAllAreasWithoutFKs";
        private const string READ_ALL_AREAS_WITH_BUILDINGS = "ReadAllAreasWithBuildings";
        private const string READ_ALL_AREAS_WITH_PERSONS = "ReadAllAreasWithPersons";
        private const string ADD_AREA = "AddArea";
        private const string DELETE_AREA = "DeleteArea";
        private const string UPDATE_AREA = "UpdateArea";
        private const string READ_AREA_BY_ID = "ReadAreaById";
        private const string READ_AREA_BY_ID_WITH_BUILDINGS = "ReadAreaByIdWithBuildings";
        private const string READ_AREA_BY_ID_WITH_PERSONS = "ReadAreaByIdWithPersons";
        #endregion

        #region AuxiliaryClasses
        private class AreaWithBuildings {
            public int AreaId { get; set; }
            public int BuildingId { get; set; }
            public bool IsHistorical { get; set; }
            public string Type { get; set; }

        }

        private class AreaWithPersons
        {
            public int AreaId { get; set; }
            public int PersonId { get; set; }
            public string Name { get; set; }
            public string Religion { get; set; }
            public DateTime DoB { get; set; }
            public string BurialCertifNr { get; set; }
            public bool IsVIP { get; set; }
        }
        #endregion

        public AreaRepository()
        {

            
        }

        public List<Area> ReadAllAreas()
        {
            Dictionary<int, Area> result = new Dictionary<int, Area>();
            List<Area> areas=DBManager.ExecuteReadCommand<Area>(READ_ALL_AREAS_WITHOUT_FKS, ReaderToModel);
            foreach (var area in areas)
            {
                area.Buildings = new List<Building>();
                area.Deceased = new List<Deceased>();
                result.Add(area.AreaId, area);
            }
            List<AreaWithBuildings> areasWithBuildings = DBManager.ExecuteReadCommand<AreaWithBuildings>(READ_ALL_AREAS_WITH_BUILDINGS, ReaderToModelWithBuildings);
            foreach (var bArea in areasWithBuildings)
            {
                if (bArea != null)
                {

                    result[bArea.AreaId].Buildings.Add(new Building() { BuildingId = bArea.BuildingId, IsHistorical = bArea.IsHistorical, Type = bArea.Type });
                }
            }
            List<AreaWithPersons> areasWithPersons = DBManager.ExecuteReadCommand<AreaWithPersons>(READ_ALL_AREAS_WITH_PERSONS, ReaderToModelWithPersons);
            foreach (var pArea in areasWithPersons)
            {
                if (pArea != null)
                {

                    result[pArea.AreaId].Deceased.Add(new Deceased() { PersonId = pArea.PersonId, Name = pArea.Name, BurialCertificateNumber = pArea.BurialCertifNr, DateOfBurial = pArea.DoB, Religion = pArea.Religion, IsVIP = pArea.IsVIP });
                }
            }

            return result.Values.ToList();


        }

        public void AddArea(Area area,int contractId)
        {
            SqlParameter[] param = {
                new SqlParameter("@Number", SqlDbType.Int) { Value = area.Number },
                new SqlParameter("@Surface", SqlDbType.Int) { Value = area.Surface },
                new SqlParameter("@GraveyardId", SqlDbType.Int) { Value = area.Graveyard.GraveyardId},
                new SqlParameter("@ContractId", SqlDbType.Int) { Value = contractId }
            };

            DBManager.ExecuteCommand(ADD_AREA, param);
        }

        public void DeleteArea(Area area)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value =area.AreaId }
            };
            DBManager.ExecuteCommand(DELETE_AREA, param);
        }

        public void UpdateArea(Area area, int contractId)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value =area.AreaId },
                new SqlParameter("@Number", SqlDbType.Int) { Value = area.Number },
                new SqlParameter("@Surface", SqlDbType.Int) { Value = area.Surface },
                new SqlParameter("@GraveyardId", SqlDbType.Int) { Value = area.Graveyard.GraveyardId},
                new SqlParameter("@ContractId", SqlDbType.Int) { Value = contractId }
            };

            DBManager.ExecuteCommand(UPDATE_AREA, param);
        }

        public Area ReadById(int id)
        {
            SqlParameter[] param = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = id }
            };
            Area area = DBManager.ExecuteReadCommand<Area>(READ_AREA_BY_ID,ReaderToModel,param).FirstOrDefault();
            area.Buildings = new List<Building>();
            area.Deceased = new List<Deceased>();
            SqlParameter[] param2 = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = id }
            };
            List<AreaWithBuildings> areaWithBuildings = DBManager.ExecuteReadCommand<AreaWithBuildings>(READ_AREA_BY_ID_WITH_BUILDINGS, ReaderToModelWithBuildings,param2);
            foreach (var bArea in areaWithBuildings)
            {
                area.Buildings.Add(new Building() { BuildingId = bArea.BuildingId, IsHistorical = bArea.IsHistorical, Type = bArea.Type });
            }
            SqlParameter[] param3 = {
                new SqlParameter("@Id", SqlDbType.Int) { Value = id }
            };
            List<AreaWithPersons> areaWithPersons = DBManager.ExecuteReadCommand<AreaWithPersons>(READ_AREA_BY_ID_WITH_PERSONS, ReaderToModelWithPersons,param3);
            foreach (var pArea in areaWithPersons)
            {
                area.Deceased.Add(new Deceased() { PersonId = pArea.PersonId, Name = pArea.Name, BurialCertificateNumber = pArea.BurialCertifNr, DateOfBurial = pArea.DoB, Religion = pArea.Religion, IsVIP = pArea.IsVIP });
            }
            return area;
        }

        #region Reader To Model functions
        private Area ReaderToModel(SqlDataReader reader)
        {
            return new Area
            {
                AreaId = reader.GetInt32(reader.GetOrdinal("AreaId")),
                Number = reader.GetInt32(reader.GetOrdinal("Number")),
                Surface = reader.GetInt32(reader.GetOrdinal("Surface")),
                Graveyard = new Graveyard() { 
                                              GraveyardId = reader.GetInt32(reader.GetOrdinal("GraveyardId")),
                                              Name = reader.GetString(reader.GetOrdinal("Name")),
                                              Address = reader.GetString(reader.GetOrdinal("Address"))
                                            }
            };
        }

        private AreaWithBuildings ReaderToModelWithBuildings(SqlDataReader reader)
        {
            if (reader.IsDBNull(2))
            {
                return null;
            }
            return new AreaWithBuildings()
            {
                AreaId = reader.GetInt32(reader.GetOrdinal("AreaId")),
                BuildingId = reader.GetInt32(reader.GetOrdinal("BuildingId")),
                Type = reader.GetString(reader.GetOrdinal("Type")),
                IsHistorical = reader.GetBoolean(reader.GetOrdinal("isHistorical"))
            };
        }


        private AreaWithPersons ReaderToModelWithPersons(SqlDataReader reader)
        {
            if (reader.IsDBNull(2))
            {
                return null;
            }
            return new AreaWithPersons()
            {
                AreaId = reader.GetInt32(reader.GetOrdinal("AreaId")),
                PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Religion = reader.GetString(reader.GetOrdinal("Religion")),
                DoB = reader.GetDateTime(reader.GetOrdinal("DateOfBurial")),
                IsVIP = reader.GetBoolean(reader.GetOrdinal("isVip")),
                BurialCertifNr = reader.GetString(reader.GetOrdinal("BurialCertificateNumber"))
            };

        }
        #endregion

    }
}
