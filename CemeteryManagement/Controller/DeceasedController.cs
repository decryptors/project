using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class DeceasedController
    {
        public DeceasedRepository DeceasedRepository { get; set; }
        public DeceasedController()
        {
            DeceasedRepository = new DeceasedRepository();
        }

        public List<Deceased> ReadAll() {
            return DeceasedRepository.ReadAll();
        }
    }
}
