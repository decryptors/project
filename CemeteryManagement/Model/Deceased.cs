using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Deceased:Person
    {
        public string Religion { get; set; }
        public DateTime DateOfBurial { get; set; }
        public string BurialCertificateNumber { get; set; }
        public bool IsVIP { get; set; }
        public int AreaId { get; set; }
    }
}
