using ADP.Reporting.Tool.DataServices;
using ADP.Reporting.Tool.DataServices.Interface;
using ADP.Reporting.Tool.Services;
using ADP.Reporting.Tool.Services.Interface;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddScoped<IAlphabetRepository, AlphabetRepository>();
builder.Services.AddScoped<IAlphabetService, AplhabetService>();

builder.Services.AddScoped<IClientInformationRepository, ClientInformationRepository>();
builder.Services.AddScoped<IClientInformationService, ClientInformationService>();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
