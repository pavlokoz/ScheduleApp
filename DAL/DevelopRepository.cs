using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DevelopRepository
    {
        #region Public Methods
        public void ClearDB()
        {
            using (SqlConnection connection =
                    new SqlConnection(ConfigurationManager.
                    ConnectionStrings["ScheduleDBConnectionString"].ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("ClearDB", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.ExecuteNonQuery();

            }
        }
        #endregion
    }
}
