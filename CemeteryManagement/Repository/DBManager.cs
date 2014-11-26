using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class DBManager
    {
        private const string CONNECTION_STRING = "Server=VLAD\\VLAD;Database=CemeteryManagementDB;Trusted_Connection=True;";
        /// <summary>
        /// This method is used to execute the neccessary read commands.
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="readerToModel"></param>
        /// <param name="commandParameters"></param>
        /// <returns></returns>
        public static List<T> ExecuteReadCommand<T>(string commandText, Func<SqlDataReader, T> readerToModel, params SqlParameter[] commandParameters)
        {
            List<T> readResult = new List<T>(0);
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand(commandText, connection))
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddRange(commandParameters);
                    using (SqlDataReader sqlDataReader = sqlCommand.ExecuteReader())
                    {
                        while (sqlDataReader.Read())
                        {
                            readResult.Add(readerToModel(sqlDataReader));
                        }
                    }
                }
            }
            return readResult;
        }


        /// <summary>
        /// This method is used when desiring to retrieve a single scalar value from the database. It can also get parameteres but it also can reeceive null
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="commandParameters"></param>
        /// <returns></returns>
        public static object ExecuteScalarCommand<T>(string commandText, params SqlParameter[] commandParameters)
        {

            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand(commandText, connection))
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    if (commandParameters != null)
                    {
                        sqlCommand.Parameters.AddRange(commandParameters);
                    }
                    return sqlCommand.ExecuteScalar();
                }
            }

        }
    }
}
