using DALModels.DBModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DAL
{
    public class PairRepository
    {
        #region Private Fields
        private AuditoriumRepository auditorium;
        private GroupRepository group;
        private TutorRepository tutor;
        #endregion

        #region Constructors
        public PairRepository()
        {
            auditorium = new AuditoriumRepository();
            group = new GroupRepository();
            tutor = new TutorRepository();
        }
        #endregion

        #region Public Methods
        public bool InsertPairs(IList<Pair> pairs)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.
                        ConnectionStrings["ScheduleDBConnectionString"].ConnectionString))
            {
                connection.Open();
                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    pairs.ToList().ForEach(x =>
                    {
                        try
                        {
                            long pairId = InsertPair(transaction, connection, x);
                            auditorium.InsertAuditoriumForPair(transaction, connection, pairId, x.Auditoriums);
                            group.InsertGroupForPair(transaction, connection, pairId, x.Groups);
                            tutor.InsertTutorsForPair(transaction, connection, pairId, x.Tutors);
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            throw new ArgumentException(ex.Message);
                        }
                    });
                    transaction.Commit();
                    return true;
                }
            }
        }
        #endregion

        #region Private Methods
        private long InsertPair(SqlTransaction transaction, SqlConnection connection, Pair pair)
        {
            SqlCommand command = new SqlCommand("InsertPair", connection, transaction)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.AddWithValue("Type", pair.TypeName);
            command.Parameters.AddWithValue("Weekend", pair.WeekendName);
            command.Parameters.AddWithValue("StartTime", pair.Time.StartTime);
            command.Parameters.AddWithValue("EndTime", pair.Time.EndTime);
            command.Parameters.AddWithValue("Subject", pair.SubjectName);
            command.Parameters.AddWithValue("Day", pair.DayName);

            return Convert.ToInt64(command.ExecuteScalar());
        }
        #endregion
    }
}
