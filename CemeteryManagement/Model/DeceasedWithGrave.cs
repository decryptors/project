using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DeceasedWithGrave:Person
    {
        public string Religion { get; set; }
        public DateTime DateOfBurial { get; set; }
        public int AreaId { get; set; }
    }
}
