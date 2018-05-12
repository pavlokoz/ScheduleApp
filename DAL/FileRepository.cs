using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DocumentWorker;

namespace DAL
{
    public class FileRepository
    {
        #region Public Methods
        public virtual bool CheckFileHash(byte[] openedFile)
        {
            foreach (var file in GetHashAllFiles())
            {
                if (FileHasher.CompareHashes(file, openedFile))
                {
                    return true;
                }
            }
            return false;
        }

        public virtual bool InsertFileHashInDB(string filePath, byte[] fileHash)
        {
            using (SqlConnection connection =
                new SqlConnection(ConfigurationManager.
                ConnectionStrings["ScheduleDBConnectionString"].ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("InsertHashOfFile", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("filePath", filePath);
                command.Parameters.AddWithValue("fileHash", fileHash);

                return Convert.ToBoolean(command.ExecuteNonQuery());
            }
        }
        #endregion

        #region Private Methods
        private IList<byte[]> GetHashAllFiles()
        {
            using (SqlConnection connection =
                    new SqlConnection(ConfigurationManager.
                    ConnectionStrings["ScheduleDBConnectionString"].ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("GetHashesOfFiles", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    IList<byte[]> listToReturn = new List<byte[]>();
                    while (reader.Read())
                    {
                        listToReturn.Add((byte[])reader["FileHash"]);
                    }
                    return listToReturn;
                }
            }
        }
        #endregion
    }
}
