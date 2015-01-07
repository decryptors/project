using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository;
using Model;

namespace Controller
{
    public class LoginController
    {
        private LoginRepository LoginRepository { get; set; }
        public LoginController()
        {
            LoginRepository = new LoginRepository();
        }

        public bool CheckUsernamePassword(Login credentials)
        {
            return LoginRepository.CheckLogin(credentials);
        }

    }
}
