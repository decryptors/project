using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository;
using Model;


namespace Controller
{
    public class ContractController
    {
        private ContractRepository ContractRepository { get; set; }
        public ContractController()
        {
            ContractRepository = new ContractRepository();
        }
        public List<Contract> ReadAll()
        {
            return ContractRepository.ReadAllContracts();
        }
        public void Add(Contract contract, int personId)
        {
            ContractRepository.AddContract(contract, personId);
        }
        public void Update(Contract contract, int personId)
        {
            ContractRepository.UpdateContract(contract, personId);
        }
        public Contract ReadById(int contractId)
        {
            return ContractRepository.ReadById(contractId);
        }
        public void Delete(Contract contract)
        {
            ContractRepository.DeleteContract(contract);
        }
    }
}
