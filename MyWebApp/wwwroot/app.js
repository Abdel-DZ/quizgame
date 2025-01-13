// Function to fetch categories from API
async function fetchCategories() {
  try {
    const response = await fetch('http://localhost:3000/api/categories');
    const categories = await response.json();
    console.log("Fetched categories:", categories);
    populateCategories(categories);
  } catch (error) {
    console.error('Error fetching categories:', error);
  }
}

// Function to populate the category dropdown
function populateCategories(categories) {
  const selectElement = document.getElementById("category-select");
  categories.forEach(category => {
    const option = document.createElement("option");
    option.value = category.id;
    option.textContent = category.name;
    selectElement.appendChild(option);
  });
}

// Function to fetch questions based on selected category
async function fetchQuestions(categoryId) {
  try {
    const response = await fetch(`http://localhost:3000/api/questions/${categoryId}`);
    const questions = await response.json();
    console.log("Fetched questions:", questions);
    displayQuestions(questions);
  } catch (error) {
    console.error('Error fetching questions:', error);
  }
}

// Function to display the questions on the page
function displayQuestions(questions) {
  const container = document.getElementById("questions-container");
  container.innerHTML = ''; // Clear previous questions

  questions.forEach((question, index) => {
    const questionElement = document.createElement("div");
    questionElement.classList.add("question");

    const questionText = document.createElement("p");
    questionText.textContent = question.questionText;
    questionElement.appendChild(questionText);

    // Create answer options
    const options = [question.option1, question.option2, question.option3, question.option4];
    options.forEach((option, i) => {
      const optionLabel = document.createElement("label");
      optionLabel.textContent = option;

      const optionInput = document.createElement("input");
      optionInput.type = "radio";
      optionInput.name = `question-${index}`;
      optionInput.value = i + 1; // Option values: 1, 2, 3, 4

      // Add an event listener to check the selected option
      optionInput.addEventListener("change", (event) => {
        handleAnswerSelection(event, question.correctAnswer);  // Pass the correctAnswer here
      });

      optionLabel.appendChild(optionInput);
      questionElement.appendChild(optionLabel);
    });

    container.appendChild(questionElement);
  });
}

// Function to handle the answer selection and validation
function handleAnswerSelection(event, correctAnswer) {
  const selectedOption = event.target.value;
  if (parseInt(selectedOption) === correctAnswer) { // Use parseInt to compare correctly
    alert("Correct!");
  } else {
    alert(`Incorrect! The correct answer was option ${correctAnswer}`);
  }
}

// Event listener for category selection
document.getElementById("category-select").addEventListener("change", (event) => {
  const categoryId = event.target.value;
  fetchQuestions(categoryId);
});

// Initialize the application
document.addEventListener("DOMContentLoaded", () => {
  fetchCategories();
});

