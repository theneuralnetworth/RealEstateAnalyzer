namespace RealEstateAPI.Model
{
    public class Category
    {
        public string Name { get; set; }

        public string Value { get; set; }

        public List<string> Justifications { get; set; }

        public Category(string name, string value)
        {
            this.Name = name;
            this.Value = value;
        }
    }
}