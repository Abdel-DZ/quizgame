document.addEventListener("DOMContentLoaded", async () => {
    let currentQuestionIndex = 0; // Track the current question index
    const questionsList = document.getElementById('questions-list'); // Container for questions
    const urlParams = new URLSearchParams(window.location.search);
    const category = urlParams.get('category');
    const localUrl = `http://127.0.0.1:5261/api/questions/${encodeURIComponent(category)}`;

    // Fetch a single question from the backend
    async function fetchQuestion() {
        try {
            const response = await fetch(localUrl);
            const questionData = await response.json();
            return questionData[0]; // Since the backend ensures only one question is returned
        } catch (error) {
            console.error('Error fetching question:', error);
            return null;
        }
    }

    // Display the current question
    function displayQuestion(question) {
        const correctAnswer = question.correctanswer; // Store the correct answer
        questionsList.innerHTML = ''; // Clear the container for new content

        const div = document.createElement('div');
        div.className = 'profile__data';
        div.innerHTML = ` 
            <div class="profile__description">
                <h2 class="subtitle" style="color: #dc3545;" id="question-header">Question ${currentQuestionIndex + 1}</h2>
                <p class="content" id="question-text" style="color: black;">${question.questiontext}</p>
            </div>
            <div class="profile__skills-container">
                <h3>ALTERNATIVES</h3>
                <ul>
                    ${[1, 2, 3, 4]
                        .map(
                            (num) => ` 
                            <li class="profile__skill">
                                <div class="load-bar">
                                    <div class="load-bar__bar bar--80" style="background-color: transparent;">
                                        <button class="answer-btn" data-answer="${num}">${question[`option${num}`]}</button>
                                    </div>
                                </div>
                            </li>
                        `
                        )
                        .join('')}
                </ul>
            </div>
        `;
        questionsList.appendChild(div);

        // Add event listeners to buttons
        const buttons = div.querySelectorAll('.answer-btn');
        buttons.forEach((button) => {
            button.addEventListener('click', (event) => handleAnswerClick(event, correctAnswer, buttons));
        });
    }

    // Handle answer clicks
    function handleAnswerClick(event, correctAnswer, buttons) {
        const clickedButton = event.target;
        const clickedAnswer = parseInt(clickedButton.getAttribute('data-answer'));

        // Check if the clicked answer matches the correct answer
        if (clickedAnswer === correctAnswer) {
            clickedButton.style.backgroundColor = 'green'; // Color the button green for correct answer
            clickedButton.style.color = 'white'; // Ensure text remains readable
        } else {
            clickedButton.style.backgroundColor = 'red'; // Color the button red for incorrect answer
            clickedButton.style.color = 'white'; // Ensure text remains readable
        }

        // Disable all buttons after selection
        buttons.forEach((btn) => (btn.disabled = true));

        // After a delay, load the next question or finish the quiz
        setTimeout(async () => {
            currentQuestionIndex++;
            if (currentQuestionIndex < 10) { // Limit to 10 questions
                const nextQuestion = await fetchQuestion();
                if (nextQuestion) displayQuestion(nextQuestion);
            } else {
                // Show 'Quiz Completed!' without trying to load another question
                questionsList.innerHTML = `<h2 class="subtitle" style="color: #28a745;">Quiz Completed!</h2>`;
            }
        }, 1000);
    }

    // Initialize the quiz
    const firstQuestion = await fetchQuestion();
    if (firstQuestion) {
        displayQuestion(firstQuestion); // Load the first question
    } else {
        questionsList.innerHTML = `<h2 class="subtitle" style="color: #dc3545;">No questions available for this category.</h2>`;
    }
});
