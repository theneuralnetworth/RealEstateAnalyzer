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
    [Route("/")]
    public class HealthController : ControllerBase
    {
        private readonly HttpClient _httpClient;

        public HealthController(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [HttpGet("health")]
        public async Task<IActionResult> HealthCheck()
        {
            return Ok(new { status = "Healthy" });
        }
    }
}
