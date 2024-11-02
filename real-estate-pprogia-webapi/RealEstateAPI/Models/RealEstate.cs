namespace RealEstateAPI.Model
{
    public class RealEstate
    {
        public string ID { get; set; }

        public string Title { get; set; }

        public double Price { get; set; }

        public double Area { get; set; }

        public int Rooms { get; set; }

        public Location Location { get; set; }

        public List<string> Images { get; set; }

        public double TotalScore { get; set; }

        public List<Category> Categories { get; set; }
    }
}