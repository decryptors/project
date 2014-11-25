using System.Collections.Generic;

namespace Repository
{
    public interface IRepository<T>
    {
        T AddElement(T element);
        void RemoveElement(T element);
        void UpdateElement(T elementToUpdate, T newElement);
        IList<T> GetAllElements();
    }
}
