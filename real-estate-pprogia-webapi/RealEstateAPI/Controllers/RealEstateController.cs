using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Collections.Generic;
using RealEstateAPI.Model;
using RealEstateAPI.DTO;
using System.Text;

namespace RealEstateAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RealEstatesController : ControllerBase
    {
        private readonly HttpClient _httpClient;

        public RealEstatesController(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [HttpPost("GetRealEstates")]
        public async Task<IActionResult> GetAllRealEstates([FromBody] PreferencesDTO preferences)
        {
            var jsonContent = JsonConvert.SerializeObject(new { preferences });
            var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync("http://localhost:8080/realestates", content);

            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadAsStringAsync();
                var prologResult = JsonConvert.DeserializeObject<PrologResultDTO>(result);
        
        
                List<RealEstate> realEstates = new List<RealEstate>();
                
                foreach (var item in prologResult.RealEstates)
                {
                    RealEstate estate = new RealEstate();

                    switch (item.Type)
                    {
                        case "location_property":
                            estate.ID = item.Args[0];
                            estate.Location = item.Args[1];
                            break;
                    
                    }
                    if(estate?.ID != null){
                        realEstates.Add(estate);
                    }
                }

                foreach (var item in prologResult.RealEstates)
                {
                    switch (item.Type)
                    {
                        case "final_score":
                            var estate = realEstates.Find(x => x.ID == item.Args[0]);
                            estate.FinalScore = Double.Parse(item.Args[1]);
                            break;
                    
                    }
                }
                
                return Ok(realEstates);
            }
            else
            {
                return StatusCode((int)response.StatusCode, "Error calling Prolog API");
            }
        }
    }
}

