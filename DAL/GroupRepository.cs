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
    class GroupRepository
    {
        public void InsertGroupForPair(SqlTransaction transaction, SqlConnection connection, long pairId, IList<Group> groups)
        {
            groups.ToList().ForEach(x =>
            {

                SqlCommand command = new SqlCommand("InsertGroupForPair", connection, transaction)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("PairId", pairId);
                command.Parameters.AddWithValue("GroupName", x.GroupName);

                command.ExecuteNonQuery();
            });
        }
    }
}
