using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers(); // API controllers
builder.Services.AddDirectoryBrowser(); // Enable directory browsing if needed

// Add CORS services
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins", builder =>
        builder.AllowAnyOrigin() // Allow all origins
            .AllowAnyMethod() // Allow all HTTP methods (GET, POST, etc.)
            .AllowAnyHeader()); // Allow all headers
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/error.html"); // Serve a custom error page in production
}

// Serve static files (default is wwwroot folder)
app.UseStaticFiles();

// Enable directory browsing (optional, for debugging)
app.UseDirectoryBrowser();

// Use CORS policy
app.UseCors("AllowAllOrigins");

// Route API requests to controllers
app.MapControllers();

// Fallback to index.html for SPA-style routing
app.MapFallbackToFile("index.html");

app.Run();