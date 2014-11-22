using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    class Area
    {
        public List<Deceased> Deceased { get; set; }
        public int Number { get; set; }
        public double Surface { get; set; }
        public Graveyard Graveyard { get; set; }
        public List<Building> Buildings { get; set; }
        public string PhotoURL { get; set; }
    }
}
