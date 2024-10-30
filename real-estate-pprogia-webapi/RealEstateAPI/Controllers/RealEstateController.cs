using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Collections.Generic;
using RealEstateAPI.Model;
using RealEstateAPI.DTO;
using System.Text;
using System.Globalization;

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

            try
            {
                var prologHost = Environment.GetEnvironmentVariable("PROLOG_URL") ?? "http://localhost:8080";
                
                var response = await _httpClient.PostAsync($"http://prolog:8000/realestates", content);

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
                                estate.Location = new Location(item.Args[1]);
                                break;

                        }
                        if (estate?.ID != null)
                        {
                            realEstates.Add(estate);
                        }
                    }

                    foreach (var item in prologResult.RealEstates)
                    {
                        var estate = realEstates.Find(x => x.ID == item.Args[0]);
                        switch (item.Type)
                        {
                            case "property":
                                estate.Title = item.Args[1];
                                break;
                            case "final_score":
                                estate.TotalScore = Double.Parse(item.Args[1]);
                                break;
                            case "price":
                                estate.Price = Double.Parse(item.Args[1]);
                                break;
                            case "image":
                                if(estate.Images == null)
                                {
                                    estate.Images = new List<string>();
                                }
                                estate.Images.Add(item.Args[1]);
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
            catch (HttpRequestException httpEx)
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, $"HTTP Request Error: {httpEx.Message}");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Internal Server Error: {ex.Message}");
            }
        }
    }
}

