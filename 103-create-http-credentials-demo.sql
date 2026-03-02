/*
    Store credentials to access the HTTP endpoint
*/ 

if not exists(select * from sys.database_scoped_credentials where [name] = 'https://my-azure-service.cognitiveservices.azure.com/')
begin
    create database scoped credential [https://my-azure-service.cognitiveservices.azure.com/]
    with identity = 'HTTPEndpointHeaders', secret = '{"api-key":"..."}';
end
go

/*
    Even better, use Managed Identity if you can, as explained here:
    https://devblogs.microsoft.com/azure-sql/go-passwordless-when-calling-azure-openai-from-azure-sql-using-managed-identities/

if not exists(select * from sys.database_scoped_credentials where [name] = '<OPENAI_URL>')
begin
    create database scoped credential [<OPENAI_URL>]
    with identity = 'Managed Identity', secret = '{"resourceid":"https://cognitiveservices.azure.com"}';
end
go

*/