﻿using DALModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class TutorRepository
    {
        public void InsertTutorsForPair(SqlTransaction transaction, SqlConnection connection, long pairId, IList<Tutor> tutors)
        {
            tutors.ToList().ForEach(x =>
            {

                SqlCommand command = new SqlCommand("InsertTutorForPair", connection, transaction)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("PairId", pairId);
                command.Parameters.AddWithValue("TutorName", x.TutorName);

                command.ExecuteNonQuery();
            });
        }
    }
}
