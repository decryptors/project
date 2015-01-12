using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class AreaController
    {
        private AreaRepository AreaRepository { get; set; }

        public AreaController()
        {
            AreaRepository = new AreaRepository();
        }

        public List<Area> ReadAll()
        {
            return AreaRepository.ReadAllAreas();
        }
        public void Add(Area area,int contractId)
        {
            AreaRepository.AddArea(area,contractId);
        }
        public void Update(Area area,int contractId)
        {
            AreaRepository.UpdateArea(area,contractId);
        }
        public Area ReadById(int areaId)
        {
            return AreaRepository.ReadById(areaId);
        }
        public void Delete(Area area)
        {
            AreaRepository.DeleteArea(area);
        }

    }
}
