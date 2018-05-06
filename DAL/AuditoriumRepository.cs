using DALModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class AuditoriumRepository
    {
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
    }
}
