using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class AreaRequest
    {
        public DateTime Date { get; set; }
        public int Number { get; set; }
        public string InfocetNumber { get; set; }
        public AreaRequestState State { get; set; }
    }
}
