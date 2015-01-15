using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ContractWithPerson
    {
        public int ContractId { get; set; }
        public DateTime StartDate { get; set; }
        public int Number { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
    }
}
