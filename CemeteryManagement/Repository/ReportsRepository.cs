﻿using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class ReportsRepository
    {
        private const string READ_ALL_CONTRACTS_WITH_PERSONS = "ReadAllContractsWithPersons";
        private const string READ_ALL_HOMELESS = "Persons_ReadAllHomeless";
        private const string READ_ALL_DECEASED_WITH_AREA = "ReadAllDeadWithAreas";


        public List<ContractWithPerson> ReadAllContracts()
        {
            
            return DBManager.ExecuteReadCommand<ContractWithPerson>(READ_ALL_CONTRACTS_WITH_PERSONS, ReaderToModelRegG);
        }

        public List<HomelessForRegister> ReadAllHomeless()
        {
            return DBManager.ExecuteReadCommand<HomelessForRegister>(READ_ALL_HOMELESS, ReaderToModelRegE);
        }

        public List<DeceasedWithArea> ReadAllDeceasedWithArea()
        {

            return DBManager.ExecuteReadCommand<DeceasedWithArea>(READ_ALL_DECEASED_WITH_AREA, ReaderToModelRegD);
        }



        private HomelessForRegister ReaderToModelRegE(SqlDataReader reader)
        {
            return new HomelessForRegister
            {
                
                BurialCertificateNumber = reader.GetString(reader.GetOrdinal("BurialCertificateNumber")),
                RequestNumber = reader.GetString(reader.GetOrdinal("RequestNo")),
                Map=new byte[20]
            };
        }


        private ContractWithPerson ReaderToModelRegG(SqlDataReader reader)
        {
            return new ContractWithPerson
            {
                ContractId = reader.GetInt32(reader.GetOrdinal("ContractId")),
                StartDate = reader.GetDateTime(reader.GetOrdinal("DateTime")),
                Number = reader.GetInt32(reader.GetOrdinal("InvoiceNo")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Address = reader.GetString(reader.GetOrdinal("Address"))
               
            };
        }

        private DeceasedWithArea ReaderToModelRegD(SqlDataReader reader)
        {
            return new DeceasedWithArea
            {
                Name = reader.GetString(reader.GetOrdinal("Persons.Name")),
                CemeteryName = reader.GetString(reader.GetOrdinal("Graveyards.Name")),
                AreaNumber = reader.GetInt32(reader.GetOrdinal("Areas.Number"))
            };
        }

    }
}
