
using System.IO.Pipelines;
using Microsoft.AspNetCore.Mvc;

namespace Backend; // Define the quizgame namespace for the classes in this file

public class Actions
{
    private readonly Database _database; // The Database class is injected here to handle database interactions

    // Constructor that accepts a Database instance for later use
    public Actions(Database database)
    {
        _database = database; // Store the database instance to use in methods
    }

    /* public async Task<IResult> GetAllQuestions()
    {
        // Create a command to query the database for questions by category
        String datastring =
            "SELECT questiontext, option1, option2, option3, option4, correctanswer FROM QuestionsByCategory";
        
        await using var connection = _database.Connection().CreateCommand(datastring);
        //connection.Parameters.AddWithValue("$1", category); // Add the category parameter to the query

        var result = new List<object>(); // Create a list to hold the results from the query

        // Execute the query and read the data
        await using (var reader = await connection.ExecuteReaderAsync())
        {
            while (await reader.ReadAsync()) // Read each row from the database
            {
                // Add the question and options to the result list
                result.Add(new
                {
                    questiontext = reader.GetString(0), // Get the question text
                    option1 = reader.GetString(1), // Get option 1
                    option2 = reader.GetString(2), // Get option 2
                    option3 = reader.GetString(3), // Get option 3
                    option4 = reader.GetString(4), // Get option 4
                    correctanswer= reader.GetInt32(5), // Get right answer
                    id = reader.GetInt32(6), // Get question id
                });
            }
        }

        return Results.Ok(result); // Return the result as a successful respons
    }
    */
    
    // Method to fetch questions by category from the database
    public async Task<IResult> GetQuestionsByCategory(string category)
    {
        // Create a command to query the database for questions by category
        String datastring =
            "SELECT questiontext, option1, option2, option3, option4,correctanswer,id FROM QuestionsByCategory WHERE categoryname = '"+category+"'";
        
        await using var connection = _database.Connection().CreateCommand(datastring);
        //connection.Parameters.AddWithValue("$1", category); // Add the category parameter to the query

        var result = new List<object>(); // Create a list to hold the results from the query

        // Execute the query and read the data
        await using (var reader = await connection.ExecuteReaderAsync())
        {
            while (await reader.ReadAsync()) // Read each row from the database
            {
                // Add the question and options to the result list
                result.Add(new
                {
                    questiontext = reader.GetString(0), // Get the question text
                    option1 = reader.GetString(1), // Get option 1
                    option2 = reader.GetString(2), // Get option 2
                    option3 = reader.GetString(3), // Get option 3
                    option4 = reader.GetString(4), // Get option 4
                    correctanswer = reader.GetInt32(5), //get Answer
                    id = reader.GetInt32(6), //question id
                });
            }
        }
        if (result.Count<1) return Results.NotFound();
        
        
        // here is say 1 objects 
        while (result.Count > 1)
        {
            //remove random object until only 1 remains! 
            
            int remoteAtID = new Random().Next(0, result.Count);
            result.RemoveAt(remoteAtID);
        }
        return Results.Ok(result); // Return the result as a successful response
    }
}
