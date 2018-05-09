namespace DALModels.DTOModels
{
    public class DTOAuditorium
    {
        public string AuditoriumName { get; set; }

        public override string ToString()
        {
            return AuditoriumName;
        }
    }
}
