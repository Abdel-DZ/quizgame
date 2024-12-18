namespace quizgame
{
    public class Menu
    {
        private readonly Actions _actions;

        public Menu(Actions actions)
        {
            _actions = actions;
            ShowMenu();
        }

        private void ShowMenu()
        {
            while (true)
            {
                Console.WriteLine("Select a category:");
                Console.WriteLine("1. History");
                Console.WriteLine("2. Biology");
                Console.WriteLine("3. Geography");
                Console.WriteLine("4. Mathematics");
                Console.WriteLine("5. Natural Science");
                Console.WriteLine("6. Exit");

                string input = Console.ReadLine();

                switch (input)
                {
                    case "1":
                        PlayCategory("History");
                        break;
                    case "2":
                        PlayCategory("Biology");
                        break;
                    case "3":
                        PlayCategory("Geography");
                        break;
                    case "4":
                        PlayCategory("Mathematics");
                        break;
                    case "5":
                        PlayCategory("Natural Science");
                        break;
                    case "6":
                        return;
                    default:
                        Console.WriteLine("Invalid choice, please try again.");
                        break;
                }
            }
        }
        private void PlayCategory(string category)
        {
            while (true)
            {
                var questions = _actions.GetQuestionsByCategory(category);

                if (questions.Count < 10)
                {
                    Console.WriteLine("There are not enough questions in this category.");
                    return;
                }

                var randomQuestions = _actions.ShuffleQuestions(questions, 10);

                int questionNumber = 1; // Counter for question numbering
                foreach (var question in randomQuestions)
                {
                    Console.WriteLine($"\nQuestion {questionNumber}: {question.Text}");
                    Console.WriteLine($"1. {question.Option1}");
                    Console.WriteLine($"2. {question.Option2}");
                    Console.WriteLine($"3. {question.Option3}");
                    Console.WriteLine($"4. {question.Option4}");
                    Console.Write("Your answer (1-4): ");

                    if (int.TryParse(Console.ReadLine(), out int chosenOption))
                    {
                        if (_actions.ValidateAnswer(question, chosenOption))
                        {
                            Console.WriteLine("Correct answer!");
                        }
                        else
                        {
                            Console.WriteLine("Wrong answer!");
                        }
                    }
                    else
                    {
                        Console.WriteLine("Invalid input.");
                    }

                    questionNumber++; // Increment question number
                }

                // After asking 10 questions, ask the player if they want to continue
                Console.WriteLine("\nDo you want to continue with more questions in this category? (Y/N)");
                string continueInput = Console.ReadLine().ToUpper();

                if (continueInput != "Y")
                {
                    Console.WriteLine("Returning to main menu...");
                    return;
                }
            }
        }

    }
}
