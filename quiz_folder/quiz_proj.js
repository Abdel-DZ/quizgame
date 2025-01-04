// npm install prompt-sync
import promptSync from 'prompt-sync'; // Import prompt-sync
const prompt = promptSync(); // Initialize prompt-sync


let sentence = 'THE SKY IS BLUE';

function get_underscores(string_sentence) {
    let sentence_length = string_sentence.length;
    let underscores = '_'.repeat(sentence_length); // Create underscores based on the length of the sentence
    let result = ''; // Initialize an empty result string

    for (let i = 0; i < string_sentence.length; i++) {
        if (string_sentence[i] == ' ') {
            result += ' ';  // Add a space at the specified indices
        } else {
            result += underscores[i];  // Keep the underscore at other positions
        }
    }
    
    return result; // Return the resulting string
} 



function guess_chars(underscore_string, sentence_to_guess)
                {
                    let result = []
                    var guessed_char = prompt('Which letter do you choose? '); // Prompt for letter
                    for (let i=0; i<underscore_string.length; i++)
                    {
                        if (sentence_to_guess[i]==(guessed_char))
                            {result.push(guessed_char);}
                        else
                            {result.push(underscore_string[i])}

                    }
                        let formatted_result=result.join('')
                        if (formatted_result != underscore_string)
                        {console.log('Right choice, '+ guessed_char + ' is there')
                            return formatted_result}
                        else
                        {
                        console.log('Wrong Choice, Try again !')
                        return formatted_result
                        }
                    }


function guess_solution(original_sentence)
                    {
                        var guessed_sentence = prompt('Enter your solution hjTH'); // Prompt for letter
                        if (original_sentence == guessed_sentence)

                            {
                            console.log( 'YES: '+ guessed_sentence + ' is the right answer ')
                            console.log('Congrats! You Won !')
                            return 'Y'}

                        else
                        {
                        console.log('NO: '+ guessed_sentence + 'is not the right sentence, Game Over  !' )
                        return 'N'}


                    } 


function chars_or_solution()// decide C for guessing letter and S for guessing entire solution
                    {var decision_string = prompt("Enter 'G' for guessing letter or any other key for guessing the solution"); 
                        return decision_string}


//let undescored_sentence = get_underscores(sentence);

//console.log(guess_chars(undescored_sentence, sentence))


let undescored_sentence = get_underscores(sentence);
for (let trial = 0; trial < 5; trial ++)
    {
        console.log ('trial nr '+ (trial + 1))
        console.log(undescored_sentence)
        let decision_made = chars_or_solution()
        if (decision_made == 'G')
            {let updated_sentence = guess_chars(undescored_sentence, sentence)
             if (updated_sentence == sentence)
                {
                    break
                }
             else
                {undescored_sentence = updated_sentence; }   
            }
        else 
        {let updated_sentence = guess_solution(sentence)
            if (updated_sentence = 'Y')
            {break}
            else
            {continue}
        }
        if (trial == 3)
            console.log('you only got one more trial')



    }