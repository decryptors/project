using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace Repository
{
    public class ContractRepository
    {
        #region String Constants
        private const string READ_ALL_CONTRACTS_WITHOUT_FKS = "ReadAllContractsWithoutFKs";
        private const string READ_ALL_CONTRACTS_WITH_AREA = "ReadAllContractsWithArea";
        private const string READ_ALL_CONTRACTS_WITH_PERSONS = "ReadAllContractsWithPersons";
        private const string ADD_CONTRACT = "AddContract";
        private const string DELETE_CONTRACT = "DeleteContract";
        private const string UPDATE_CONTRACT = "UpdateContract";
        private const string READ_CONTRACT_BY_ID = "ReadContractById";
        private const string READ_CONTRACT_BY_ID_WITH_AREAS = "ReadContractByIdWithAreas";
        private const string READ_CONTRACT_BY_ID_WITH_PERSONS = "ReadContractByIdWithPersons";
        #endregion

        #region AuxiliaryClasses
        private class ContractWithAreas
        {
            public int ContractId { get; set; }
            public int AreaId { get; set; }
            public List<Deceased> Deceased { get; set; }
            public int Number { get; set; }
            public double Surface { get; set; }
            public Graveyard Graveyard { get; set; }
            public List<Building> Buildings { get; set; }
            public byte[] Photo { get; set; }
        }

        private class ContractWithPersons
        {
            public int ContractId { get; set; }
            public int PersonId { get; set; }
            public string Name { get; set; }
            public string Address { get; set; }

        }
        #endregion

        public ContractRepository()
        {

        }

        public List<Contract> ReadAllContracts()
        {
            Dictionary<int, Contract> result = new Dictionary<int, Contract>();
            List<Contract> contracts = DBManager.ExecuteReadCommand<Contract>(READ_ALL_CONTRACTS_WITHOUT_FKS, ReaderToModel);
            return result.Values.ToList();
        }

        public void AddContract(Contract contract, int personId)
        {
            SqlParameter[] param ={
            new SqlParameter("@PersonId",SqlDbType.Int){Value=personId},
            new SqlParameter("@InvoiceNo", SqlDbType.Int){Value=contract.InfocetNumber},
            new SqlParameter("@StartDate",SqlDbType.DateTime){Value=contract.StartDate},
            new SqlParameter("@EndDate",SqlDbType.DateTime){Value=contract.EndDate},
            new SqlParameter("@numberInfo",SqlDbType.Int){Value=contract.Number} 
            };
            DBManager.ExecuteCommand(ADD_CONTRACT, param);
        }

        public void DeleteContract(Contract contract)
        {
            SqlParameter[] param ={                    
                new SqlParameter("@Id",SqlDbType.Int){Value=contract.ContractId}
            };
            DBManager.ExecuteCommand(DELETE_CONTRACT, param);
        }

        public void UpdateContract(Contract contract, int personId)
        {
            SqlParameter[] param ={
                new SqlParameter("@PersonId",SqlDbType.Int){Value=personId},
                new SqlParameter("@InvoiceNo", SqlDbType.Int){Value=contract.InfocetNumber},
                new SqlParameter("@StartDate",SqlDbType.DateTime){Value=contract.StartDate},
                new SqlParameter("@EndDate",SqlDbType.DateTime){Value=contract.EndDate},
                new SqlParameter("@numberInfo",SqlDbType.Int){Value=contract.Number}
             };
            DBManager.ExecuteCommand(UPDATE_CONTRACT, param);
        }

        public Contract ReadById(int id)
        {
            SqlParameter[] param ={
                new SqlParameter("@Id", SqlDbType.Int){Value=id}
            };
            Contract contract = DBManager.ExecuteReadCommand<Contract>(READ_CONTRACT_BY_ID, ReaderToModel, param).FirstOrDefault();

            return contract;
        }
        #region Reader To Model functions
        private Contract ReaderToModel(SqlDataReader reader)
        {
            return new Contract
            {
                ContractId = reader.GetInt32(reader.GetOrdinal("ContractId")),
                InfocetNumber = reader.GetString(reader.GetOrdinal("InvoiceNo")),
                StartDate = reader.GetDateTime(reader.GetOrdinal("DateTime")),
                EndDate = reader.GetDateTime(reader.GetOrdinal("EndDate")),
                Number = reader.GetInt32(reader.GetOrdinal("numberInfo")),
                Owner = new Owner()
                {
                    PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                    Name = reader.GetString(reader.GetOrdinal("Name")),
                    Address = reader.GetString(reader.GetOrdinal("Address"))
                },
                Area = new Area()
                {

                }
            };
        }

        private ContractWithAreas ReaderToModelWithAreas(SqlDataReader reader)
        {
            if (reader.IsDBNull(6))
            {
                return null;
            }
            return new ContractWithAreas()
            {
                ContractId = reader.GetInt32(reader.GetOrdinal("ContractId")),
                AreaId = reader.GetInt32(reader.GetOrdinal("AreaId")),
                Number = reader.GetInt32(reader.GetOrdinal("Number")),
                Surface = reader.GetInt32(reader.GetOrdinal("Surface")),
                Photo = (byte[])reader["Photo"],
                Graveyard = new Graveyard()
                {
                    GraveyardId = reader.GetInt32(reader.GetOrdinal("GraveyardId")),
                    Name = reader.GetString(reader.GetOrdinal("Name")),
                    Address = reader.GetString(reader.GetOrdinal("Address"))
                }
            };
        }

        private ContractWithPersons ReaderToModelWithPersons(SqlDataReader reader)
        {
            return new ContractWithPersons()
            {
                ContractId = reader.GetInt32(reader.GetOrdinal("ContractId")),
                PersonId = reader.GetInt32(reader.GetOrdinal("PersonId")),
                Name = reader.GetString(reader.GetOrdinal("Name"))
            };
        }
        #endregion
    }
}