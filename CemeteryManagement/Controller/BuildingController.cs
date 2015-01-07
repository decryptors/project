using Model;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class BuildingController
    {
        private BuildingRepository _repository = new BuildingRepository();
        public List<Building> ReadAll()
        {
            return _repository.ReadAllBuildings();

        }

        public Building ReadByID(int id)
        {

            return _repository.ReadByID(id);
        }

        public void Add(Building building, int areaId)
        {
            _repository.AddBuilding(building, areaId);
        }

        public void Delete(Building building)
        {
            _repository.DeleteBuilding(building);
        }

        public void Update(Building building, int areaId)
        {
            _repository.UpdateBuilding(building, areaId);
        }
    }
}
