using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;

namespace ToDoWebService.Middlewares
{
    public class APIKeyHandler
    {
        private readonly RequestDelegate _next;
        private readonly string _apiKey;

        public APIKeyHandler(RequestDelegate next)
        {
            _next = next;

            //Consultar de uma configuração externa.
            _apiKey = "2d07f4c342a08bf1a8a9b58193899052"; 
        }

        public async Task Invoke(HttpContext context)
        {
            bool validKey = false;

            var isApiAddress = context.Request.Path.Value.Contains("api/");
            var hasApiKey = context.Request.Headers.ContainsKey("X-API-KEY");

            if (hasApiKey)
            {
                var receivedApiKey = context.Request.Headers["X-API-KEY"];
                validKey = receivedApiKey.Equals(_apiKey);
            }

            if (isApiAddress && !validKey)
            {
                context.Response.StatusCode = (int)HttpStatusCode.Forbidden;
                await context.Response.WriteAsync("Invalid API Key");
            }
            else
            {
                await _next.Invoke(context);
            }
        }
    }

    public static class MiddlewareApiExtensions
    {
        public static IApplicationBuilder UseApiKeyHanddler(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<APIKeyHandler>();
        }
    }
}
