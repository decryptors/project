using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class AreaRepository
    {
        private const string READ_ALL_AREAS_WITHOUT_FKS = "ReadAllAreasWithoutFKs";
        private const string READ_ALL_AREAS_WITH_BUILDINGS = "ReadAllAreasWithBuildings";
        private const string READ_ALL_AREAS_WITH_PERSONS = "ReadAllAreasWithPersons";
        private const string ADD_AREA = "AddArea";
        private const string DELETE_AREA = "DeleteArea";
        private const string UPDATE_AREA = "UpdateArea";
        private const string READ_AREA_BY_ID = "ReadAreaById";

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
                result[bArea.AreaId].Buildings.Add(new Building() { BuildingId = bArea.BuildingId, IsHistorical = bArea.IsHistorical, Type = bArea.Type });
            }
            List<AreaWithPersons> areasWithPersons = DBManager.ExecuteReadCommand<AreaWithPersons>(READ_ALL_AREAS_WITH_PERSONS, ReaderToModelWithPersons);
            foreach (var pArea in areasWithPersons)
            {
                result[pArea.AreaId].Deceased.Add(new Deceased() { PersonId = pArea.PersonId, Name = pArea.Name, BurialCertificateNumber = pArea.BurialCertifNr, DateOfBurial = pArea.DoB, Religion = pArea.Religion, IsVIP = pArea.IsVIP });
            }

            return result.Values.ToList();


        }

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

    }
}
