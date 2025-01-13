using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace MyWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CategoriesController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public CategoriesController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        public IActionResult GetCategories()
        {
            var categories = new List<object>();

            try
            {
                using var connection = new NpgsqlConnection(_configuration.GetConnectionString("DefaultConnection"));
                connection.Open();

                using var command = new NpgsqlCommand("SELECT * FROM category", connection);
                using var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // Retrieve columns with their correct data types
                    int id = reader.GetInt32(0);            // Column 1 (integer)
                    string name = reader.GetString(1);     // Column 2 (string)

                    // Add the category as an object (id and name)
                    categories.Add(new { Id = id, Name = name });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }

            return Ok(categories);
        }
    }
}