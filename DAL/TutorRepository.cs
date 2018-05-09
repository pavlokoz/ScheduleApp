using DALModels.DBModels;
using DALModels.DTOModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class TutorRepository
    {
        #region Public Methods
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

        public DTOTutor GetPairsForTutor(string tutorName)
        {
            using (SqlConnection connection =
                    new SqlConnection(ConfigurationManager.
                    ConnectionStrings["ScheduleDBConnectionString"].ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("GetTutorPairs", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("TutorName", tutorName);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    IList<DTOPair> pairs = new List<DTOPair>();
                    while (reader.Read())
                    {
                        pairs.Add(new DTOPair
                        {
                            Auditoriums = reader["Auditoriums"].ToString().
                                Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries).
                                Select(x => new DTOAuditorium { AuditoriumName =x }).ToList(),
                            Groups = reader["Groups"].ToString().
                                Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries).
                                Select(x => new DTOGroup { GroupName = x }).ToList(),
                            Time = new DTOTime
                            {
                                StartTime = (TimeSpan)reader["StartTime"],
                                EndTime = (TimeSpan)reader["EndTime"]
                            },
                            Day = reader["Day"].ToString(),
                            Subject = reader["Subject"].ToString(),
                            Type = reader["Type"].ToString(),
                            Weekend = reader["Weekend"].ToString()                            
                        });
                    }
                    return new DTOTutor
                    {
                        TutorName = tutorName,
                        Pairs = pairs
                    };
                }
            }
        }
        #endregion
    }
}
