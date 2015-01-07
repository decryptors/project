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
        private DeceasedRepository DeceasedRepository { get; set; }
        public DeceasedController()
        {
            DeceasedRepository = new DeceasedRepository();
        }

        public List<Deceased> ReadAll() {
            return DeceasedRepository.ReadAll();
        }
        public void Add(Deceased deceased){
            DeceasedRepository.AddDeceased(deceased);
        }
        public void Update(Deceased deceased)
        {
            DeceasedRepository.UpdateDeceased(deceased);
        }
        public Deceased ReadById(int personId)
        {
            return DeceasedRepository.ReadByID(personId);
        }
        public void Delete(Deceased deceased)
        {
            DeceasedRepository.DeleteDeceased(deceased);
        }

        public List<DeceasedWithGrave> ReadDeceasedWithAreaId(DateTime date) {
            return DeceasedRepository.ReadDeceasedWithAreaId(date);
        }
    }
}
