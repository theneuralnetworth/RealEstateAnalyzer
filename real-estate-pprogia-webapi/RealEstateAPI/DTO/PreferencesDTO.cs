namespace RealEstateAPI.DTO
{
    public class PreferencesDTO
    {
        public PreferenceCategoryDTO preferences { get; set; }
    }

    public class PreferenceCategoryDTO
    {
        public int security { get; set; }

        public int comfort { get; set; }

        public int accessibility { get; set; }

        public int maintenance { get; set; }

        public int energy_efficiency { get; set; }

        public int services { get; set; }

        public int connectivity { get; set; }

        public int view_quality { get; set; }

        public int spaciousness { get; set; }

        public int sun_exposure { get; set; }

        public int parking { get; set; }

        public int state { get; set; }

        public int potential_appreciation { get; set; }
    }
}
