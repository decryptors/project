using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    class HomelessController
    {
        private HomelessRepository HomelessRepository { get; set; }
         public HomelessController()
        {
            HomelessRepository = new HomelessRepository();
        }

        public List<Homeless> ReadAll() {
            return HomelessRepository.ReadAll();
        }
        public void Add(Homeless homeless)
        {
            HomelessRepository.AddHomeless(homeless);
        }
        public void Update(Homeless homeless)
        {
            HomelessRepository.UpdateHomeless(homeless);
        }
        public Homeless ReadById(int personId)
        {
            return HomelessRepository.ReadByID(personId);
        }
        public void Delete(Homeless homeless)
        {
            HomelessRepository.DeleteHomeless(homeless);
        }
    }
}
