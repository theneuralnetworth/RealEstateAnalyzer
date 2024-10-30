namespace RealEstateAPI.Model
{
    public class RealEstate
    {
        public string ID { get; set; }

        public string Title { get; set; }

        public double Price { get; set; }

        public Location Location { get; set; }

        public List<string> Images { get; set; }

        public double TotalScore { get; set; }
    }
}