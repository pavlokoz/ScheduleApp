using System.IO;
using System.Security.Cryptography;

namespace DocumentWorker
{
    public static class FileHasher
    {
        #region Public Methods
        public static byte [] HashMD5(string filename)
        {
            using (var md5 = MD5.Create())
            {
                using (var stream = File.OpenRead(filename))
                {
                    return md5.ComputeHash(stream);
                }
            }
        }

        public static bool CompareHashes(byte []firstFile, byte []secondFile)
        {
            bool bEqual = false;
            if (firstFile.Length == secondFile.Length)
            {
                int i = 0;
                while ((i < firstFile.Length) && (firstFile[i] == secondFile[i]))
                {
                    i++;
                }
                if (i == firstFile.Length)
                {
                    bEqual = true;
                }
            }

            return bEqual;
        }
        #endregion
    }
}
