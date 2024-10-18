
namespace RealEstateAPI.DTO
{
    public class PrologResultDTO
    {
        public List<PrologFact> RealEstates { get; set; }
    }

    public class PrologFact
    {
        public string Type { get; set; }
        public List<string> Args { get; set; }
    }
}