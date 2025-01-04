// Function to fetch categories and populate the dropdown
function fetchCategories() {
  fetch('/categories')
    .then(response => response.json())
    .then(categories => {
      console.log('Fetched categories:', categories);

      const categorySelect = document.getElementById('category-select');
      categorySelect.innerHTML = '<option value="" disabled selected>Select a category</option>';
      
      categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category.id;
        option.textContent = category.categoryname;
        categorySelect.appendChild(option);
      });
    })
    .catch(err => console.error('Error fetching categories:', err));
}

// Function to fetch and display questions for a selected category
function fetchQuestions(categoryId) {
  fetch(`/questions/${categoryId}`)
    .then(response => response.json())
    .then(questions => {
      const questionContainerDiv = document.getElementById('questions-container');
      questionContainerDiv.innerHTML = ''; // Clear previous content

      console.log('Fetched questions:', questions); // Log questions for debugging

      questions.forEach(question => {
        const questionDiv = document.createElement('div');
        questionDiv.classList.add('question');
        questionDiv.innerHTML = `
          <p><strong>Question:</strong> ${question.questiontext}</p>
          <p>
            1. <button onclick="checkAnswer(1, ${question.correctanswer})">${question.option1}</button>
          </p>
          <p>
            2. <button onclick="checkAnswer(2, ${question.correctanswer})">${question.option2}</button>
          </p>
          <p>
            3. <button onclick="checkAnswer(3, ${question.correctanswer})">${question.option3}</button>
          </p>
          <p>
            4. <button onclick="checkAnswer(4, ${question.correctanswer})">${question.option4}</button>
          </p>
        `;
        questionContainerDiv.appendChild(questionDiv);
      });
    })
    .catch(err => console.error('Error fetching questions:', err));
}



// Function to check if the selected answer is correct
/*function checkAnswer(selectedOption, correctAnswer) {
  const resultDiv = document.getElementById('result');
  console.log(`Selected option: ${selectedOption}, Correct answer: ${correctAnswer}`);
  
  const correctAnswerNum = parseInt(correctAnswer, 10);
  
  if (selectedOption === correctAnswerNum) {
    resultDiv.textContent = 'Correct!';
  } else {
    resultDiv.textContent = 'Incorrect! The correct answer was option ' + correctAnswerNum;
  }
  
  console.log("Updated result:", resultDiv.textContent); // Check if text is being updated
}
*/

function checkAnswer(selectedOption, correctAnswer) {
  const resultDiv = document.getElementById('result');
  console.log(`Selected option: ${selectedOption}, Correct answer: ${correctAnswer}`);
  
  const correctAnswerNum = parseInt(correctAnswer, 10);
  
  // Hardcoded test result for debugging purposes
  resultDiv.textContent = 'This is a test result!';
  
  console.log("Updated result:", resultDiv.textContent); // Log the updated result
  console.log("Result div:", resultDiv); // Log the div itself to ensure it's being accessed correctly
}




// Function to fetch categories and populate the dropdown
function fetchCategories() {
  fetch('/categories')
    .then(response => response.json())
    .then(categories => {
      console.log('Fetched categories:', categories);

      const categorySelect = document.getElementById('category-select');
      categorySelect.innerHTML = '<option value="" disabled selected>Select a category</option>';
      
      categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category.id;
        option.textContent = category.categoryname;
        categorySelect.appendChild(option);
      });
    })
    .catch(err => console.error('Error fetching categories:', err));
}

// Function to fetch and display questions for a selected category
function fetchQuestions(categoryId) {
  fetch(`/questions/${categoryId}`)
    .then(response => response.json())
    .then(questions => {
      const questionContainerDiv = document.getElementById('questions-container');
      questionContainerDiv.innerHTML = ''; // Clear previous content

      console.log('Fetched questions:', questions); // Log questions for debugging

      questions.forEach(question => {
        const questionDiv = document.createElement('div');
        questionDiv.classList.add('question');
        questionDiv.innerHTML = `
          <p><strong>Question:</strong> ${question.questiontext}</p>
          <p>
            1. <button onclick="checkAnswer(1, ${question.correctanswer})">${question.option1}</button>
          </p>
          <p>
            2. <button onclick="checkAnswer(2, ${question.correctanswer})">${question.option2}</button>
          </p>
          <p>
            3. <button onclick="checkAnswer(3, ${question.correctanswer})">${question.option3}</button>
          </p>
          <p>
            4. <button onclick="checkAnswer(4, ${question.correctanswer})">${question.option4}</button>
          </p>
        `;
        questionContainerDiv.appendChild(questionDiv);
      });
    })
    .catch(err => console.error('Error fetching questions:', err));
}



// Function to check if the selected answer is correct
function checkAnswer(selectedOption, correctAnswer) {
  const resultDiv = document.getElementById('result');
  console.log(`Selected option: ${selectedOption}, Correct answer: ${correctAnswer}`);
  
  const correctAnswerNum = parseInt(correctAnswer, 10);
  
  if (selectedOption === correctAnswerNum) {
    resultDiv.textContent = 'Correct!';
  } else {
    resultDiv.textContent = 'Incorrect! The correct answer was option ' + correctAnswerNum;
  }
  
  console.log("Updated result:", resultDiv.textContent); // Check if text is being updated
}




// Event listener for when a category is selected
document.getElementById('category-select').addEventListener('change', function() {
  const selectedCategoryId = this.value;
  if (selectedCategoryId) {
    fetchQuestions(selectedCategoryId);
  }
});

// Initialize categories when the page loads
document.addEventListener('DOMContentLoaded', function() {
  console.log("DOM Content Loaded");
  fetchCategories();
});




// Event listener for when a category is selected
document.getElementById('category-select').addEventListener('change', function() {
  const selectedCategoryId = this.value;
  if (selectedCategoryId) {
    fetchQuestions(selectedCategoryId);
  }
});

// Initialize categories when the page loads
document.addEventListener('DOMContentLoaded', function() {
  console.log("DOM Content Loaded");
  fetchCategories();
});
