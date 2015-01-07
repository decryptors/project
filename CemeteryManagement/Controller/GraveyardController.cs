using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class GraveyardController
    {
        private GraveyardRepository GraveyardRepository { get; set; }

        public GraveyardController()
        {
            GraveyardRepository = new GraveyardRepository();
        }

        public List<Graveyard> ReadAll()
        {
            return GraveyardRepository.ReadAllGraveyards();
        }
        public void Add(Graveyard graveyard)
        {
            GraveyardRepository.AddGraveyard(graveyard);
        }
        public void Update(Graveyard graveyard)
        {
            GraveyardRepository.UpdateGraveyard(graveyard);
        }
        public Graveyard ReadById(int graveyardId)
        {
            return GraveyardRepository.ReadByID(graveyardId);
        }
        public void Delete(Graveyard graveyard)
        {
            GraveyardRepository.DeleteGraveyard(graveyard);
        }


    }
}
