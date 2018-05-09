using DALModels.DBModels;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    class AuditoriumRepository
    {
        #region Public Methods
        public void InsertAuditoriumForPair(SqlTransaction transaction, SqlConnection connection, long pairId, IList<Auditorium> auditoria)
        {
            auditoria.ToList().ForEach(x =>
            {

                SqlCommand command = new SqlCommand("InsertAuditoriumForPair", connection, transaction)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("PairId", pairId);
                command.Parameters.AddWithValue("AuditoriumName", x.AuditoriumName);

                command.ExecuteNonQuery();
            });
        }
        #endregion
    }
}
