using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using Model;

namespace Repository
{
    public class LoginRepository
    {
        private const string CHECK_USER = "CheckUser";

        public bool CheckLogin(Login credentials)
        {
            MD5 md5hash = MD5.Create();
            byte[] data = md5hash.ComputeHash(Encoding.UTF8.GetBytes(credentials.password));
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                stringBuilder.Append(data[i].ToString("x2"));
            }

            SqlParameter[] parameters = {
                new SqlParameter("@Name", SqlDbType.NVarChar, 50) { Value = credentials.name },
                new SqlParameter("@Password", SqlDbType.NVarChar, 200) { Value = stringBuilder.ToString() }
                };
            return (int)DBManager.ExecuteScalarCommand<int>(CHECK_USER, parameters) == 1;
        }
    }
}
