CREATE TABLE Products (
ProductId INT PRIMARY KEY,
ProductName NVARCHAR(120),
Embedding VECTOR(3) -- A 3-dimensional vector
);

--Inserting Vector Data
--You can insert vector data either as a JSON array or directly as a vector:

INSERT INTO Products (ProductId, ProductName, Embedding)
VALUES
(101, 'Blue T-Shirt', '[0.10, 0.50, 0.90]'),
(102, 'Red T-Shirt', JSON_ARRAY(0.20, 0.40, 0.80));

--Querying Vector Data
--To retrieve vector data, you can cast it back to JSON for readability:

DECLARE @v VECTOR(3) = '[1.0, -0.2, 30]';
SELECT
CAST(@v AS NVARCHAR(MAX)) AS VectorAsString,
CAST(@v AS JSON) AS VectorAsJSON;

--Performing Vector Operations
--Calculating Vector Distance
--The VECTOR_DISTANCE function computes the similarity or distance between two vectors using metrics 
--like cosine, Euclidean, or dot product:

DECLARE @A VECTOR(3) = '[1, 2, 3]';
DECLARE @B VECTOR(3) = '[4, 5, 6]';

SELECT
VECTOR_DISTANCE('euclidean', @A, @B) AS EuclideanDistance,
VECTOR_DISTANCE('cosine', @A, @B) AS CosineSimilarity;

--Nearest Neighbor Search (k-NN)
--To find the most similar vectors in a dataset, you can use the VECTOR_DISTANCE function 
--for exact searches:

DECLARE @queryVector VECTOR(3) = '[0.10, 0.50, 0.90]';

SELECT TOP 3
ProductId,
ProductName,
VECTOR_DISTANCE('cosine', @queryVector, Embedding) AS Similarity
FROM Products
ORDER BY Similarity ASC;

--Approximate Nearest Neighbor Search (ANN)
--For large datasets, use the VECTOR_SEARCH function with a pre-created vector index 
--for faster approximate searches:

DECLARE @queryVector2 VECTOR(3) = '[0.10, 0.50, 0.90]';

SELECT
p.ProductId,
p.ProductName,
s.distance AS Similarity
FROM VECTOR_SEARCH(
TABLE = Products AS p,
COLUMN = Embedding,
SIMILAR_TO = @queryVector2,
METRIC = 'cosine',
TOP_N = 3
) AS s
ORDER BY s.distance;