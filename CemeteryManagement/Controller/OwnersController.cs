using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class OwnersController
    {
         private OwnerRepository OwnerRepository { get; set; }
         public OwnersController()
        {
            OwnerRepository = new OwnerRepository();
        }

        public List<Owner> ReadAll() {
            return OwnerRepository.ReadAll();
        }
        public void Add(Owner owner)
        {
            OwnerRepository.AddOwner(owner);
        }
        public void Update(Owner owner)
        {
            OwnerRepository.UpdateOwner(owner);
        }
        public Owner ReadById(int personId)
        {
            return OwnerRepository.ReadByID(personId);
        }
        public void Delete(Owner owner)
        {
            OwnerRepository.DeleteOwner(owner);
        }
    }
}
