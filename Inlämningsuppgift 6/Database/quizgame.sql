-- Create Users table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100),
    Score INT DEFAULT 0
);

-- Create Category table
CREATE TABLE Category (
    id INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);




-- Create Questions table with AgeGroup_id as a foreign key to AgeGroups and Category_id as a foreign key to Category
CREATE TABLE Questions (
    id INT PRIMARY KEY,
    Category_id INT,
    QuestionText TEXT,
    Option1 VARCHAR(100),
    Option2 VARCHAR(100),
    Option3 VARCHAR(100),
    Option4 VARCHAR(100),
    CorrectAnswer INT,
    FOREIGN KEY (Category_id) REFERENCES Category(id)
);

-- Create Sessions table to track user game sessions
CREATE TABLE Sessions (
    id INT PRIMARY KEY,
    User_id INT,
    StartTime TIMESTAMP,
    EndTime TIMESTAMP,
    Score INT,
    FOREIGN KEY (User_id) REFERENCES Users(id)
);

-- Insert categories
INSERT INTO Category (id, CategoryName) VALUES
(1, 'History'),
(2, 'Geography'),
(3, 'Biology'),
(4, 'Mathematics'),
(5, 'Science');



INSERT INTO Questions (id, Category_id, QuestionText, Option1, Option2, Option3, Option4, CorrectAnswer)
VALUES
(1, 1, 'Who was the first Emperor of China?', 'Confucius', 'Qin Shi Huang', 'Genghis Khan', 'Alexander the Great', 2),
(2, 1, 'In which year did the Roman Empire fall?', '476 AD', '300 AD', '800 AD', '1000 AD', 1),
(3, 1, 'Who was the first President of the United States?', 'George Washington', 'Thomas Jefferson', 'John Adams', 'Abraham Lincoln', 1),
(4, 1, 'Which ancient civilization built the pyramids?', 'Greece', 'Rome', 'Babylon', 'Egypt', 4),
(5, 1, 'What was the cause of the French Revolution?', 'Taxation', 'Invasion by foreign powers', 'Plague', 'Corruption', 1),
(6, 1, 'Who was the first woman to fly solo across the Atlantic?', 'Sally Ride', 'Amelia Earhart', 'Valentina Tereshkova', 'Beryl Markham', 2),
(7, 1, 'What major event happened on July 20, 1969?', 'The Berlin Wall fell', 'The first man walked on the moon', 'World War II ended', 'The United Nations was founded', 2),
(8, 1, 'Who was the first man on the moon?', 'Buzz Aldrin', 'Neil Armstrong', 'Michael Collins', 'John Glenn', 2),
(9, 1, 'Which country did the United States gain independence from?', 'France', 'Germany', 'Spain', 'England', 4),
(10, 1, 'What year was the Magna Carta signed?', '1215', '1300', '1453', '1607', 1),
(11, 1, 'Who was the first African American to win the Nobel Peace Prize?', 'Martin Luther King Jr.', 'Frederick Douglass', 'Malcolm X', 'Rosa Parks', 1),
(12, 1, 'What caused the Black Death?', 'Plague bacteria', 'Natural disasters', 'Famine', 'War', 1),
(13, 1, 'Which empire was known for its vast silk trade routes?', 'Mongol Empire', 'Tang Dynasty', 'Ottoman Empire', 'Roman Empire', 2),
(14, 1, 'Who was the first President of South Africa?', 'Nelson Mandela', 'Desmond Tutu', 'F.W. de Klerk', 'Thabo Mbeki', 2),
(15, 1, 'Who was Cleopatra?', 'A queen of Egypt', 'A famous painter', 'A warrior from Asia', 'A mythological figure', 1),
(16, 1, 'What was the purpose of the Great Wall of China?', 'To protect against invasions', 'To mine minerals', 'To farm crops', 'To establish trade routes', 1),
(17, 1, 'Which famous ship sank in the Atlantic Ocean in 1912?', 'The Titanic', 'The Lusitania', 'The Bismarck', 'The Mayflower', 1),
(18, 1, 'Who was the first woman to become a U.S. Senator?', 'Barbara Mikulski', 'Jeannette Rankin', 'Kamala Harris', 'Hillary Clinton', 2),
(19, 1, 'What is the name of the ancient city in Egypt with the famous sphinx?', 'Alexandria', 'Luxor', 'Cairo', 'Thebes', 4),
(20, 1, 'Who was the first explorer to circumnavigate the globe?', 'Magellan', 'Columbus', 'Vasco da Gama', 'Pizarro', 1),
(21, 1, 'What year did Christopher Columbus discover America?', '1492', '1776', '1607', '1857', 1),
(22, 1, 'Which ancient civilization is known for its Hanging Gardens?', 'Greece', 'Babylon', 'Rome', 'Egypt', 2),
(23, 1, 'Who was the first man to fly solo across the English Channel?', 'Charles Lindbergh', 'Amelia Earhart', 'Louis Bleriot', 'Robert Scott', 3),
(24, 1, 'What is the oldest known civilization in the world?', 'Egyptian', 'Chinese', 'Greek', 'Sumerian', 4),
(25, 1, 'Who was the first female pharaoh of Egypt?', 'Hatshepsut', 'Cleopatra', 'Nefertiti', 'Ramesses', 1),
(26, 1, 'Which famous philosopher taught the idea of democracy?', 'Plato', 'Socrates', 'Aristotle', 'Confucius', 1),
(27, 1, 'What year did the United Nations officially come into existence?', '1945', '1939', '1920', '1889', 1),
(28, 1, 'Who was the first president of the Russian Federation?', 'Boris Yeltsin', 'Vladimir Putin', 'Mikhail Gorbachev', 'Leonid Brezhnev', 1),
(29, 1, 'Which ancient city is famous for its hanging gardens?', 'Babylon', 'Athens', 'Carthage', 'Rome', 1),
(30, 1, 'Who discovered the sea route to India around Africa?', 'Christopher Columbus', 'Vasco da Gama', 'Ferdinand Magellan', 'Marco Polo', 2);


INSERT INTO Questions (id, Category_id, QuestionText, Option1, Option2, Option3, Option4, CorrectAnswer)
VALUES
(31, 2, 'What is the process by which plants make their food using sunlight?', 'Photosynthesis', 'Respiration', 'Fermentation', 'Transpiration', 1),
(32, 2, 'Which organ in the human body pumps blood?', 'Liver', 'Kidney', 'Heart', 'Lung', 3),
(33, 2, 'What is the basic unit of life?', 'Atom', 'Cell', 'Molecule', 'Tissue', 2),
(34, 2, 'What is the main function of chlorophyll in plants?', 'To store water', 'To help plants grow', 'To absorb sunlight', 'To produce oxygen', 3),
(35, 2, 'Which part of the cell contains its genetic material?', 'Nucleus', 'Cytoplasm', 'Ribosome', 'Mitochondria', 1),
(36, 2, 'What is the process by which animals break down food to release energy?', 'Photosynthesis', 'Respiration', 'Transpiration', 'Digestion', 2),
(37, 2, 'What is the largest organ in the human body?', 'Skin', 'Liver', 'Kidney', 'Heart', 1),
(38, 2, 'What do we call the study of plant life?', 'Zoology', 'Botany', 'Ecology', 'Biology', 2),
(39, 2, 'Which organ filters waste products from the blood?', 'Liver', 'Kidney', 'Lung', 'Heart', 2),
(40, 2, 'What is the main function of red blood cells?', 'To carry oxygen', 'To digest food', 'To protect against diseases', 'To absorb nutrients', 1),
(41, 2, 'What do we call the tiny units that carry genetic information?', 'Nuclei', 'Chromosomes', 'Genes', 'Cells', 3),
(42, 2, 'What is the main function of the cell membrane?', 'To produce energy', 'To protect and support the cell', 'To store water', 'To help with respiration', 2),
(43, 2, 'What is the term for a group of similar cells working together?', 'Organ', 'Tissue', 'Organism', 'System', 2),
(44, 2, 'What is the name of the process by which plants release oxygen?', 'Photosynthesis', 'Respiration', 'Transpiration', 'Digestion', 1),
(45, 2, 'What is the term for a living thing that produces its own food?', 'Carnivore', 'Omnivore', 'Producer', 'Herbivore', 3),
(46, 2, 'Which vitamin is known as ascorbic acid?', 'Vitamin A', 'Vitamin B', 'Vitamin C', 'Vitamin D', 3),
(47, 2, 'What is the function of mitochondria in a cell?', 'To digest food', 'To produce energy', 'To store water', 'To protect the cell', 2),
(48, 2, 'Which part of the plant is responsible for absorbing water and nutrients?', 'Stem', 'Root', 'Leaf', 'Flower', 2),
(49, 2, 'What is the largest bone in the human body?', 'Femur', 'Humerus', 'Tibia', 'Radius', 1),
(50, 2, 'Which part of the plant is responsible for photosynthesis?', 'Root', 'Stem', 'Leaf', 'Flower', 3),
(51, 2, 'What is the term for a group of similar organisms capable of interbreeding?', 'Species', 'Population', 'Community', 'Ecosystem', 1),
(52, 2, 'What is the function of the chloroplasts in plant cells?', 'To store energy', 'To produce food', 'To protect the cell', 'To store water', 2),
(53, 2, 'Which part of the plant carries food and nutrients throughout the plant?', 'Xylem', 'Phloem', 'Root', 'Stem', 2),
(54, 2, 'What is the study of animals called?', 'Botany', 'Zoology', 'Microbiology', 'Ecology', 2),
(55, 2, 'What is the process by which organisms produce new organisms like themselves?', 'Reproduction', 'Digestion', 'Photosynthesis', 'Respiration', 1),
(56, 2, 'Which organ in the human body produces bile?', 'Pancreas', 'Liver', 'Stomach', 'Small intestine', 2),
(57, 2, 'What do we call an organism that eats other organisms for energy?', 'Producer', 'Decomposer', 'Herbivore', 'Carnivore', 4),
(58, 2, 'What is the main function of the nucleus in a cell?', 'To store water', 'To produce energy', 'To store genetic material', 'To protect the cell', 3),
(59, 2, 'What is the largest group of mammals?', 'Bats', 'Rats', 'Dogs', 'Whales', 4),
(60, 2, 'What is the primary function of white blood cells?', 'To transport oxygen', 'To fight infections', 'To store nutrients', 'To produce hormones', 2);


INSERT INTO Questions (id, Category_id, QuestionText, Option1, Option2, Option3, Option4, CorrectAnswer)
VALUES
(61, 3, 'What is the capital of Brazil?', 'Rio de Janeiro', 'São Paulo', 'Brasília', 'Curitiba', 3),
(62, 3, 'Which mountain range runs through Italy?', 'Andes', 'Rockies', 'Alps', 'Pyrenees', 3),
(63, 3, 'The longest river in North America is...', 'Mississippi', 'Nile', 'Amazon', 'Yangtze', 1),
(64, 3, 'Which city is known as the City of Canals?', 'Venice', 'Paris', 'Amsterdam', 'Bruges', 1),
(65, 3, 'The River Thames flows through which city?', 'London', 'Edinburgh', 'Cardiff', 'Dublin', 1),
(66, 3, 'Which continent is the Sahara Desert located on?', 'Asia', 'Africa', 'Europe', 'Australia', 2),
(67, 3, 'What is the name of the famous mountain in Switzerland?', 'Matterhorn', 'Jungfrau', 'Eiger', 'Mont Blanc', 1),
(68, 3, 'Which country is known for its tulip fields?', 'Netherlands', 'Belgium', 'Denmark', 'Germany', 1),
(69, 3, 'The Great Barrier Reef is located off the coast of which country?', 'Australia', 'New Zealand', 'USA', 'Brazil', 1),
(70, 3, 'What is the capital of Canada?', 'Toronto', 'Montreal', 'Vancouver', 'Ottawa', 4),
(71, 3, 'Which river flows through Egypt?', 'Nile', 'Amazon', 'Mississippi', 'Yangtze', 1),
(72, 3, 'The city of Istanbul is located in which two continents?', 'Asia and Africa', 'Europe and Africa', 'North America and Europe', 'South America and Asia', 2),
(73, 3, 'What is the capital of Japan?', 'Tokyo', 'Osaka', 'Kyoto', 'Hokkaido', 1),
(74, 3, 'Which continent is known as the “Land of the Midnight Sun”?', 'Asia', 'Europe', 'North America', 'Australia', 2),
(75, 3, 'The Amazon rainforest is located in which continent?', 'Asia', 'Africa', 'South America', 'North America', 3),
(76, 3, 'Which river is the longest in the world?', 'Mississippi', 'Nile', 'Amazon', 'Yangtze', 2),
(77, 3, 'What is the name of the largest island in the world?', 'New Guinea', 'Greenland', 'Borneo', 'Madagascar', 2),
(78, 3, 'The city of Cairo is the capital of which country?', 'Egypt', 'Sudan', 'Libya', 'Greece', 1),
(79, 3, 'Which desert is the largest in Asia?', 'Karakum', 'Kalahari', 'Sahara', 'Gobi', 4),
(80, 3, 'The city of Cape Town is located in which country?', 'South Africa', 'Australia', 'New Zealand', 'Canada', 1),
(81, 3, 'The River Danube flows through which European cities?', 'Vienna, Budapest, Belgrade, Bratislava', 'Paris, Berlin, Rome', 'Madrid, Lisbon, Amsterdam', 'Athens, Istanbul, Sofia', 1),
(82, 3, 'Which ocean separates Africa from South America?', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean', 1),
(83, 3, 'What is the capital of Peru?', 'Lima', 'Quito', 'Bogotá', 'Santiago', 1),
(84, 3, 'Which continent has the most countries?', 'Asia', 'Africa', 'Europe', 'South America', 2),
(85, 3, 'What is the main language spoken in Spain?', 'Portuguese', 'Catalan', 'Spanish', 'Galician', 3),
(86, 3, 'The largest desert in Africa is the...', 'Karakum', 'Kalahari', 'Sahara', 'Gobi', 3),
(87, 3, 'Which country is known for its tulip fields?', 'Sweden', 'Netherlands', 'Belgium', 'Denmark', 2),
(88, 3, 'The city of Sydney is located in which country?', 'Australia', 'New Zealand', 'USA', 'Canada', 1),
(89, 3, 'What is the main language spoken in Brazil?', 'Spanish', 'Portuguese', 'French', 'Italian', 2),
(90, 3, 'Which country is known as the Land of the Rising Sun?', 'Japan', 'China', 'South Korea', 'Vietnam', 1);


INSERT INTO Questions (id, Category_id, QuestionText, Option1, Option2, Option3, Option4, CorrectAnswer)
VALUES
(91, 4, 'What is the sum of 5 and 3?', '6', '7', '8', '9', 3),
(92, 4, 'What is 6 multiplied by 7?', '36', '42', '48', '54', 2),
(93, 4, 'What is the result of 15 - 9?', '5', '6', '7', '8', 3),
(94, 4, 'What is the square of 4?', '8', '12', '14', '16', 4),
(95, 4, 'What is the result of 3 x 6?', '18', '24', '36', '42', 1),
(96, 4, 'What is 100 divided by 5?', '10', '15', '20', '25', 3),
(97, 4, 'What is the next number in the sequence: 2, 4, 6, 8, __?', '9', '10', '11', '12', 2),
(98, 4, 'What is the perimeter of a square with side length 5 units?', '10', '15', '20', '25', 3),
(99, 4, 'What is the value of π (pi) to one decimal place?', '3.0', '3.1', '3.2', '3.3', 2),
(100, 4, 'What is 7 x 8?', '54', '56', '64', '72', 3),
(101, 4, 'What is the difference between 20 and 6?', '12', '14', '16', '18', 1),
(102, 4, 'What is the square root of 49?', '6', '7', '8', '9', 2),
(103, 4, 'What is 15% of 200?', '10', '15', '20', '30', 3),
(104, 4, 'What is the next number in the sequence: 3, 6, 9, 12, __?', '10', '14', '15', '18', 4),
(105, 4, 'What is the value of 2^3?', '6', '8', '9', '10', 2),
(106, 4, 'What is the perimeter of a rectangle with length 7 and width 4?', '14', '18', '20', '28', 3),
(107, 4, 'What is the result of 45 + 55?', '90', '100', '110', '120', 2),
(108, 4, 'What is the product of 9 and 7?', '52', '56', '63', '72', 3),
(109, 4, 'What is the value of 1/4 as a decimal?', '0.25', '0.5', '0.75', '1.0', 1),
(110, 4, 'What is the value of π (pi) to two decimal places?', '3.12', '3.14', '3.16', '3.18', 2),
(111, 4, 'What is the perimeter of a triangle with sides 5, 12, and 13?', '20', '24', '30', '36', 3),
(112, 4, 'What is the next number in the sequence: 5, 10, 15, __?', '18', '20', '22', '25', 2),
(113, 4, 'What is 2 x 7?', '10', '12', '14', '16', 3),
(114, 4, 'What is 25% of 80?', '10', '20', '25', '30', 4),
(115, 4, 'What is the square of 6?', '24', '30', '36', '42', 3),
(116, 4, 'What is the result of 60 / 5?', '6', '10', '12', '15', 3),
(117, 4, 'What is the value of 3^2?', '5', '6', '7', '9', 4),
(118, 4, 'What is the perimeter of a circle with radius 5?', '15π', '20π', '25π', '30π', 3),
(119, 4, 'What is the cube of 3?', '9', '18', '27', '36', 3),
(120, 4, 'What is the sum of angles in a triangle?', '90°', '180°', '270°', '360°', 2);

INSERT INTO Questions (id, Category_id, QuestionText, Option1, Option2, Option3, Option4, CorrectAnswer)
VALUES
(121, 5, 'What is the chemical symbol for water?', 'H', 'O', 'H2O', 'OH', 3),
(122, 5, 'What planet is known as the "Red Planet"?', 'Venus', 'Mars', 'Jupiter', 'Saturn', 2),
(123, 5, 'What is the process by which plants make their food?', 'Respiration', 'Digestion', 'Photosynthesis', 'Combustion', 3),
(124, 5, 'What animal is known as the king of the jungle?', 'Elephant', 'Lion', 'Tiger', 'Bear', 2),
(125, 5, 'What is the largest planet in our solar system?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 3),
(126, 5, 'What gas do plants absorb from the air to make their food?', 'Oxygen', 'Carbon dioxide', 'Nitrogen', 'Hydrogen', 2),
(127, 5, 'What is the name of the process where water changes from liquid to gas?', 'Evaporation', 'Condensation', 'Freezing', 'Melting', 1),
(128, 5, 'Which part of the human body pumps blood?', 'Kidneys', 'Brain', 'Heart', 'Lungs', 3),
(129, 5, 'What is the largest organ in the human body?', 'Liver', 'Heart', 'Skin', 'Kidneys', 3),
(130, 5, 'Which planet is closest to the Sun?', 'Earth', 'Mars', 'Venus', 'Mercury', 4),
(131, 5, 'What is the boiling point of water in degrees Celsius?', '90°C', '100°C', '110°C', '120°C', 2),
(132, 5, 'What type of animal is a dolphin?', 'Bird', 'Fish', 'Mammal', 'Reptile', 3),
(133, 5, 'What is the chemical formula for carbon dioxide?', 'CO2', 'CO', 'C2O', 'C3O', 1),
(134, 5, 'Which planet has the most moons?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 3),
(135, 5, 'What part of the plant produces seeds?', 'Roots', 'Leaves', 'Stems', 'Flowers', 4),
(136, 5, 'What is the main gas in the Earth’s atmosphere?', 'Oxygen', 'Carbon dioxide', 'Nitrogen', 'Helium', 3),
(137, 5, 'What is the hardest natural substance on Earth?', 'Iron', 'Gold', 'Diamond', 'Copper', 3),
(138, 5, 'How many bones are there in the adult human body?', '206', '212', '218', '224', 1),
(139, 5, 'What is the chemical symbol for sodium?', 'S', 'Na', 'Sn', 'Nd', 2),
(140, 5, 'Which organ in the human body is responsible for digesting food?', 'Liver', 'Stomach', 'Intestines', 'Heart', 2),
(141, 5, 'What is the name of the galaxy that contains our solar system?', 'Milky Way', 'Andromeda', 'Triangulum', 'Whirlpool', 1),
(142, 5, 'What type of cloud is associated with thunderstorms?', 'Cumulus', 'Cirrus', 'Stratus', 'Nimbus', 4),
(143, 5, 'What element does the symbol "Fe" represent?', 'Fluorine', 'Iron', 'Fermium', 'Francium', 2),
(144, 5, 'What is the chemical formula for glucose?', 'C6H12O6', 'CH4O', 'C2H5OH', 'CO', 1),
(145, 5, 'What is the main source of energy for the Earth?', 'Solar energy', 'Wind', 'Coal', 'Natural gas', 1),
(146, 5, 'Which planet has the most extreme temperature fluctuations?', 'Venus', 'Mars', 'Mercury', 'Jupiter', 3),
(147, 5, 'What type of rock is formed from the cooling of lava?', 'Igneous', 'Sedimentary', 'Metamorphic', 'Volcanic', 1),
(148, 5, 'What is the scientific name for humans?', 'Homo sapiens', 'Homo erectus', 'Homo habilis', 'Homo neanderthalensis', 1),
(149, 5, 'What is the average human body temperature in Celsius?', '35°C', '36.5°C', '37°C', '38°C', 3),
(150, 5, 'Which gas is essential for breathing?', 'Nitrogen', 'Carbon Dioxide', 'Oxygen', 'Helium', 3);


CREATE VIEW QuestionsByCategory AS
SELECT
    q.id,
    CategoryName,
    q.questiontext,
    q.option1,
    q.option2,
    q.option3,
    q.option4,
    q.correctanswer
FROM
    questions q
JOIN
    category c ON q.category_id = c.id
WHERE
    c.categoryname = categoryName;







