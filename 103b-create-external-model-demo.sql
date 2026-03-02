-- Create the EXTERNAL MODEL
CREATE EXTERNAL MODEL MyEmbeddingModel
AUTHORIZATION dbo
WITH (
      LOCATION = 'https://my-azure-service.cognitiveservices.azure.com/openai/deployments/text-embedding-3-small/embeddings?api-version=2023-05-15',
      API_FORMAT = 'Azure OpenAI',
      MODEL_TYPE = EMBEDDINGS,
      MODEL = 'text-embedding-3-small',
      CREDENTIAL = [https://my-azure-service.cognitiveservices.azure.com/]
);