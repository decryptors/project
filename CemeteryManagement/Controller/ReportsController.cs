using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class ReportsController
    {
        private ReportsRepository ReportsRepository { get; set; }

        public ReportsController()
        {
            ReportsRepository = new ReportsRepository();
        }
        public List<ContractWithPerson> ReadAllRegG()
        {
            return ReportsRepository.ReadAllContracts();
        }

        public List<HomelessForRegister> ReadAllRegE()
        {
            return ReportsRepository.ReadAllHomeless();
        }

        public List<DeceasedWithArea> ReadAllRegD()
        {
            return ReportsRepository.ReadAllDeceasedWithArea();
        }


    }
}
