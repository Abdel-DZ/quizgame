using Npgsql;

namespace quizgame
{
    public class Actions
    {
        private readonly NpgsqlDataSource _db;
        private readonly HashSet<int> _askedQuestions = new HashSet<int>(); // Track asked questions

        public Actions(NpgsqlDataSource db)
        {
            _db = db;
        }

        // Fetch questions by category
        public List<Question> GetQuestionsByCategory(string categoryName)
        {
            var questions = new List<Question>();

            using (var command = _db.CreateCommand($"SELECT q.id, q.questiontext, q.option1, q.option2, q.option3, q.option4, q.correctanswer " +
                                                   $"FROM questions q " +
                                                   $"JOIN category c ON q.category_id = c.id " +
                                                   $"WHERE c.categoryname = @categoryName"))
            {
                command.Parameters.AddWithValue("categoryName", categoryName);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int questionId = reader.GetInt32(0);

                        // Skip if the question was already asked
                        if (_askedQuestions.Contains(questionId)) continue;

                        questions.Add(new Question
                        {
                            Id = questionId,
                            Text = reader.GetString(1),
                            Option1 = reader.GetString(2),
                            Option2 = reader.GetString(3),
                            Option3 = reader.GetString(4),
                            Option4 = reader.GetString(5),
                            CorrectAnswer = reader.GetInt32(6)
                        });
                    }
                }
            }

            return questions;
        }

        // Shuffle questions and pick a subset
        public List<Question> ShuffleQuestions(List<Question> questions, int count)
        {
            var random = new Random();
            var shuffledQuestions = questions.OrderBy(q => random.Next()).Take(count).ToList();

            // Track these questions as asked
            foreach (var question in shuffledQuestions)
            {
                _askedQuestions.Add(question.Id);
            }

            return shuffledQuestions;
        }

        // Validate if the chosen answer is correct
        public bool ValidateAnswer(Question question, int chosenOption)
        {
            return question.CorrectAnswer == chosenOption;
        }
    }

    public class Question
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public string Option1 { get; set; }
        public string Option2 { get; set; }
        public string Option3 { get; set; }
        public string Option4 { get; set; }
        public int CorrectAnswer { get; set; }
    }
}
