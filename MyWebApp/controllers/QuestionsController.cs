using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace MyWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class QuestionsController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public QuestionsController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/questions/{categoryId}
        [HttpGet("{categoryId}")]
        public IActionResult GetQuestions(int categoryId)
        {
            var questions = new List<object>();

            try
            {
                using var connection = new NpgsqlConnection(_configuration.GetConnectionString("DefaultConnection"));
                connection.Open();

                // Use a parameterized query to prevent SQL injection
                using var command = new NpgsqlCommand("SELECT * FROM questions WHERE category_id = @categoryId", connection);
                command.Parameters.AddWithValue("@categoryId", categoryId);

                using var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    questions.Add(new
                    {
                        Id = reader.GetInt32(0), // Column 1: id
                        CategoryId = reader.GetInt32(1), // Column 2: category_id
                        QuestionText = reader.GetString(2), // Column 3: questiontext
                        Option1 = reader.GetString(3), // Column 4: option1
                        Option2 = reader.GetString(4), // Column 5: option2
                        Option3 = reader.GetString(5), // Column 6: option3
                        Option4 = reader.GetString(6), // Column 7: option4
                        CorrectAnswer = reader.GetInt32(7) // Column 8: correctanswer
                    });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }

            return Ok(questions);
        }
    }
}
